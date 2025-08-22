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


### `extra_nix_config`

Additional configuration text to append to nix.conf. See https://docs.lix.systems/manual/lix/2.90/command-ref/conf-file.html
for a description of the config file format.


### `lix_version`

The exact lix version to use (e.g. 2.93.2) or a URL to the Lix release (e.g.
https://releases.lix.systems/lix/lix-2.92.0/lix-2.92.0-x86_64-linux.tar.xz).

You should almost always use a version instead of the full URL.


<!-- ACTION.YML INPUTS END -->

---

<sup>1</sup>: And checks Nix is available, and also wraps with error reporting...
