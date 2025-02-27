Lix GHA Installer Action
========================

> *Simple and opinionated action to install Lix. Strictly follows the default semantics of a Lix install.*

* * *

### TLDR

It mostly just runs [the Lix Installer](https://lix.systems/install/#new-installs)<sup>1</sup>.

Some differences:

 - We use the `channel:` ref to Nixpkgs instead of the `flake:` ref, as the `flake:` ref may have issues within the GHA ecosystem, regarding rate-limiting.
 - We configure the current user as a trusted user.

* * *

Configuring the action
----------------------

<!-- ACTION.YML INPUTS START -->

### `github_access_token`

A github token that is added as an entry on extra-access-tokens in nix.conf.

By default, the `github.token` is configured. See https://docs.github.com/en/actions/security-for-github-actions/security-guides/automatic-token-authentication#permissions-for-the-github_token
for a description of the default token's permissions.


<!-- ACTION.YML INPUTS END -->

---

<sup>1</sup>: And checks Nix is available, and also wraps with error reporting...
