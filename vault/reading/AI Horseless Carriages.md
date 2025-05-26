---
source: https://koomen.dev/essays/horseless-carriages/
author: Pete Koomen
tags:
  - ai
  - design
---
Feels like one I'll think about and come back to for a long time. One of the few pieces on AI that's left me excited and inspired to use and build with AI (setting aside societal concerns, of course / always ... oh well)

> The modern software industry is built on the assumption that we need developers to act as middlemen between us and computers. They translate our desires into code and abstract it away from us behind simple, one-size-fits-all interfaces we can understand.
>
> The division of labor is clear: developers decide how software behaves in the general case, and users provide input that determines how it behaves in the specific case.
>
> By splitting the prompt into System and User components, we've created analogs that map cleanly onto these old world domains. The System Prompt governs how the LLM behaves in the general case and the User Prompt is the input that determines how the LLM behaves in the specific case.
>
>With this framing, it's only natural to assume that it's the developer's job to write the System Prompt and the user's job to write the User Prompt. That's how we've always built software.
>...
>...
>In the new world I don't need a middleman tell a computer what to do anymore. I just need to be able to write my own System Prompt, and writing System Prompts is easy!

And also:
> My core contention in this essay is this: when an LLM agent is acting on my behalf I should be allowed to teach it how to do that by editing the System Prompt.

And also:

> If developers aren't writing prompts, what will they do?
> 
> For one, they'll create UIs for building agents that operate in a particular domain, like an email inbox or a general ledger.
> 
> Most people probably won't want to write every prompt from scratch, and good agent builders won't force them to. Developers will provide templates and prompt-writing agents that help users bootstrap their own agents.
> 
> Users also need an interface for reviewing an agent's work and iterating on their prompts, similar to the little dummy email agent builder I included above. This interface gives them a fast feedback loop for teaching an agent to perform a task reliably.


And also:

>This is what AI's "killer app" will look like for many of us: teaching a computer how to do things that we don't like doing so that we can spend our time on things we do.


I'm fighting the urge to copy down the whole piece here, so good. Reminds me of [[Why Chatbots Are Not the Future]] , which seems along the same lines. Open prompt, no affordances, with human's involved mainly for review, not creative work: terrible experience. And paralleling Koomen's observation that writing a prompt is longer than writing an email, tougher to swallow when the email output is unusable. 

As a dev and designer, getting out of the user's way, not obscuring behavior (system prompt hiding), taking advantage of the previously impossible flexibility and customizability that LLMs offer. Wangling LLMs' open-endedness and attendant learning curve / usability problems (I find there's a sort of writer's block with starting at an empty chat window, partly from wondering: what will this thing even do? How will I review it?) into an experience more clearly led by the user. Or more simply put:

>AI-native software should maximize a user's leverage in a specific domain.

This piece most of all left me wondering what designing for good system prompt writing, for helping users teach AI what they want, will look like. Designing for user as director, not reviewer?





