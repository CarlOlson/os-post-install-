{ pkgs ? import <nixpkgs> {} }:

let
  myEmacs = pkgs.emacs;
  emacsWithPackages = (pkgs.emacsPackagesNgGen myEmacs).emacsWithPackages;
in
  emacsWithPackages (epkgs: (with epkgs.melpaPackages; [
    avy
    company-flx
    company-math
    company-nixos-options
    css-eldoc
    elixir-mode
    elm-mode
    emmet-mode
    ensime
    form-feed
    golden-ratio
    helm
    helm-idris
    helm-nixos-options
    hexrgb
    idris-mode
    magit
    magit-filenotify
    mocha
    monokai-theme
    multiple-cursors
    nix-mode
    org-journal
    # paredit
    robe
    rspec-mode
    scala-mode
    slime-company
    # undo-tree
    unicode-fonts
    web-mode
    window-purpose
    writegood-mode
    znc
  ]))
