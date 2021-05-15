# NixOS Dotfiles

My *hopefully* up to date dotfiles. They may not be, purely since I am lazy.

Keep in mind, this setup keeps the following in mind:

- The laptop of choice is a Thinkpad P51 using hybrid graphics (Nvidia PRIME).
- Willingness to use the deprecated bumblebee over offloading due to Kaby Lake processor.
- This repository is located at: `~/doc/nix-dot`.

# Installing

To install this setup, run:

```
$ ./nix-dot down
# nixos-rebuild switch
$ home-manager switch
```

# Updating and Commiting (for myself)

Run:

```
$ nix-dot up 
```
