
I recently had to build a text-to-speech integration into a small react application. In broad strokes, in a section of the app, we'd display a play button next to blocks of text. On click, we'd play audio of the given text being spoken. Text-to-speech was handled by an AI service, elevenlabs (aside: pretty impressive!). The below's just a recap of the client-side machinery to play streaming audio, which was a bit tricky, but also a fun exercise in learning some web APIs with which I was unfamiliar.

For background i.e. what's happening on the server: eleven offers a streaming endpoint, which I called server-side (to protect our API key) in our PHP web server, then streaming the response back to the client.

The business around OPFS is a performance optimization: after a user streams some text, we save the stream in an mp3 file and stash it in their browser's OPFS, naming via hash of the text content spoken, so if the user asks to hear the same text, we can match that input to a file, if any exists, playing that instead of re-streaming, both speeding up response time and reducing TTS service usage / costs.

The flow is:

1. user clicks play
2. check OPFS for file of tts for played text; if found, play
3. If not found, stream tts from server, playing as soon as minimum data available
4. progressively store streamed result chunks, saving in file in OPFS once stream complete

Key takeaway: this is a lot of ceremony and setup, justified commensurate with length of audio. As in, the performance boost from streaming  and the complexity to support that pay off the larger the audio file i.e. the longer an upfront download would take. If audio is short, performance difference between streaming and downloading will likely be negligible or close enough to it that doing all this work to setup streaming.

```js

// Player.jsx

const audioRef = useRef();

// ...
// display: none b/c, in my case, we played streamed audio
// in response to clicking a button i.e. no requirement for
// user to control audio via player controls
<audio ref={audioRef} style={{ display: 'none' }} />


// then, to handle playing i.e. when a user clicks a play button

const getOPFSRoot = async () => {
	const root = await navigator.storage.getDirectory();
	return root;
};

const getAudioDirectory = async (configHash) => {
	if (!configHash) {
		throw new Error('No audio directory namespace provided');
	}
	const root = await getOPFSRoot();
	const configDir = await root.getDirectoryHandle(configHash, { create: true });

	return configDir;
};

const getAudioFileName = async (text) => {
	const encoder = new TextEncoder();
	const data = encoder.encode(text);
	const hashBuffer = await crypto.subtle.digest('SHA-256', data);
	const hashArray = Array.from(new Uint8Array(hashBuffer));
	const hashHex = hashArray.map((b) => b.toString(16).padStart(2, '0')).join('');
	return `${hashHex}.mp3`;
};

const storeFile = async (audioDir, fileName, file) => {
	const fileHandle = await audioDir.getFileHandle(fileName, { create: true });
	const writable = await fileHandle.createWritable();
	await writable.write(file);
	await writable.close();
};

const playFn = Debounce(async function(textToSpeak, onPlayStart = () => {}) => {

	audioRef.current.pause();

	// ttsConfigHash is a hash of tts service settings, fetched from the server. Tells us how files are generated; if this changes, client knows to not use any files generated with prior config
	const audioDir = await getAudioDirectory(ttsConfigHash);

	// Pull from cache if available...
	let file;

	const fileName = await getAudioFileName(language, text);
	try {
		const fileHandle = await audioDir.getFileHandle(fileName);
		file = await fileHandle.getFile();
	} catch {}

	try {
		if (file) {
			const audioUrl = URL.createObjectURL(file);			
			audioRef.current.src = audioUrl;		
			audioRef.current.onended = () => {	
				URL.revokeObjectURL(audioUrl);		
			};		
			onPlayStart();
			await audioRef.current.play();
			return;
		}
	
		const mediaSource = new MediaSource();
	
		audioRef.current.src = URL.createObjectURL(mediaSource);
	
		// Wait for MediaSource to be ready
	
		await new Promise((resolve) => {
			mediaSource.addEventListener('sourceopen', () => {
			// See rationale here: https://web.dev/articles/media-mse-basics
			// Doesn't destroy object, but marks as garbage collectable once no references are left
	
				URL.revokeObjectURL(audioRef.current.src);
				resolve();
			}, { once: true });
	
		});
	
		// Create a source buffer for MP3
		const sourceBuffer = mediaSource.addSourceBuffer('audio/mpeg');
	
		let streamEnded = false;
	
		const resolvers = [];
	
		// A little funky, but the flow is...
		const enqueue = async (chunk) => {
	
			const leader = resolvers[0];
			resolvers.push(Promise.withResolvers());
	
			// ...check to see if we have a pending job, if so, wait for it to complete
			// sourceBuffer's updateend listener will read these same resolvers, then
			// resolve or reject this promise depending on the processing result.
			// In other words, we move forward here if processing completes.
			if (leader) {
				await leader.promise;
				// clean up resolvers for just-completed job, so following job is now leader,
				// to be kicked off by next chunk added
				resolvers.shift();
			}
	
			sourceBuffer.appendBuffer(chunk);
	
		};
		
		// Handle sourceBuffer update events		
		sourceBuffer.addEventListener('updateend', async () => {
		
			const { resolve, reject } = resolvers[0];
			// Start playing once we have enough data and audio isn't playing yet
			if (audioRef.current.paused && sourceBuffer.buffered.length > 0) {		
				onPlayStart();
				await audioRef.current.play();		
			}
	
			// We're certain no more data to process (nothing in-progress from stream or in MediaSource processing)
			// Not sure how sourceBuffer.updating could be true here, but just in case, per https://web.dev/articles/media-mse-basics
			if (!sourceBuffer.updating && mediaSource.readyState === 'open' && streamEnded) {
				try {
					mediaSource.endOfStream();
				} catch (e) {
					return reject(e);
	
				}	
			}
			return resolve();
		});
	
		const response = await fetch(/tts/stream, {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify({ textToSpeak }),
		});
	
		if (!response.ok) {
			throw new Error('Failed to generate TTS audio');	
		}
	
		const reader = response.body.getReader();
		const chunks = [];
		
		while (true) {
			const { done, value: data } = await reader.read();
	
			if (done) {
				streamEnded = true;
				break;
			}
	
			enqueue(data);
	
			// stash for file caching
			chunks.push(data);
		}
		
		// Background cache in OPFS
		storeFile(audioDir, fileName, new Blob(chunks, { type: 'audio/mpeg' }));
	} catch (err) {
		// handle error somehow
	}
}, 200);

```

## resources
- MediaSource: https://web.dev/articles/media-mse-basics
- OPFS
	- https://web.dev/articles/origin-private-file-system
	- for debugging: https://chromewebstore.google.com/detail/opfs-explorer/acndjpgkpaclldomagafnognkcgjignd