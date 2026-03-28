Clearly, I [love Nix](https://adamsimpson.net/writing/nixpkgs-is-a-treasure).

[So does Birkey Consulting](https://www.birkey.co/2026-03-22-why-i-love-nixos.html):

> I love NixOS because it fits especially well with the way I work in the current LLM coding era.
> Tools are changing very quickly. Coding agents often need very specific versions of utilities, compilers and runtimes. They need to install something, use it, throw it away, try another version and keep going without turning my PC into a garbage dump of conflicting state. Nix fits that model naturally. If I tell a coding agent that I use Nix, it is usually clever enough to reach for nix shell or nix develop to bring the needed tool into an isolated environment and execute it there. That is especially handy because Nix treats tooling as a declared input instead of an accidental side effect on the system.

One wrinkle I've found is that Codex will get tripped up if I add a `shell.nix` file after the session has started. My theory: Codex gets the `$PATH` value at start and has no way to update it later. Not a huge deal to exit the session, start a new one, and `/resume` the conversation.

Also, the Nix language is like if [`jsonnet`](https://jsonnet.org) got hit by an even more function-oriented truck. LLMs make this suck less though since they're great at writing Nix!
