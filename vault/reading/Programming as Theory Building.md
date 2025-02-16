---
author: Peter Naur (author of "Applying "Theory Building"" addendum uncited)
via: https://pablo.rauzy.name/dev/naur1985programming.pdf
tags:
  - programming
  - ai
---
A classic I'd been meaning to read for a while. Some parts were better than others, Naur's definitions of theory sometimes felt dramatically abstract, but then also concrete, saying that theory's ineffable, but that groups of programmers can replicate the same exact theory through training. I'm sure being overly literal, and nitpicking. Overall, I really liked the piece, a very useful intuition for working as a programmer, that your job is building experience solving problems in context, not writing code.

> Second, the expectation of the possibility of low cost program modifications conceivably finds support in the fact that a program is a text held in a medium allowing for easy editing. For this support to be valid it must clearly be assumed that the dominating cost is one of text manipulation. This would agree with a notion of programming as text production. On the Theory Building View this whole argument is false. This view gives no support to an expectation that program modifications at low cost are generally possible.

"a program is a text held in a medium allowing for easy editing". welp. To every client who's ever asked for work for free, for just a quick change!

And of course thought about AI here. AI dramatically expedites the production of program text. But where does that leave theory building? Is the time saved actually spent planning and conceiving of how the program solves for real world problems? For many simpler programs, does it matter?

I don't know.

>The death of a program happens when the programmer team possessing its theory is dissolved. A dead program may continue to be used for execution in a computer and to produce useful results. The actual state of death becomes visible when demands for modifications of the program cannot be intelligently answered.

Dramatically, I wonder how much dead software we'll see with the rise of AI. Produced rapidly, but never understood. But will that matter? If an AI can figure out changes needed, and the eventual output's correct enough, does it matter if a human programmer never understood the thing?

I imagine it will be a case of it won't matter for many cases until it loudly matters for some high-profile cases and there will be some sort of reckonings, then recalibrations in the industry. Who knows. 

From the "Applying "Theory Building"" Addendum:

> Experienced designers often start their documentation with just
	- The metaphors
	- Text describing the purpose of each major component 
	- Drawings of the major interactions between the major components 
>
> These three items alone take the next team a long way to constructing a useful theory of the design. The source code itself serves to communicate a theory to the next programmer. Simple, consistent naming conventions help the next person build a coherent theory. When people talk about “clean code,” a large part of what they are referring to is how easily the reader can build a coherent theory of the system.

Communication problem: sharing knowledge of a program not by reviewing program text, but by metaphor, discussing the conditions in the world that the program's trying to account for. 

I tend to be too verbose with documentation. Experience is the most important thing in learning to maintain a program, so the best documentation stands to be the fastest route to get working, to give people a mental map of navigating and explaining the program text. The map doesn't have to be the full truth, so long as it's ultimately useful in the "all models are wrong, some models are useful" sense. Hmm