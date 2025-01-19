Lix GHA Installer Action
========================

> *Simple and opinionated action to install Lix. Strictly follows the default semantics of a Lix install.*

* * *

### TLDR

It mostly just runs [the Lix Installer](https://lix.systems/install/#new-installs)<sup>1</sup>.

Some differences:

 - We use the `channel:` ref to Nixpkgs instead of the `flake:` ref, as the `flake:` ref may have issues within the GHA ecosystem, regarding rate-limiting.
 - We configure the current user as a trusted user.

No options.

* * *

<sup>1</sup>: And checks Nix is available, and also wraps with error reporting...
