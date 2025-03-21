{ pkgs, ...}: {

  ##########################################################################
  #
  #  Install all apps and packages here.
  #
  #  NOTE: Your can find all available options in:
  #    https://daiderd.com/nix-darwin/manual/index.html
  #
  # TODO Fell free to modify this file to fit your needs.
  #
  ##########################################################################

  # Install packages from nix's official package repository.
  #
  # The packages installed here are available to all users, and are reproducible across machines, and are rollbackable.
  # But on macOS, it's less stable than homebrew.
  #
  # Related Discussion: https://discourse.nixos.org/t/darwin-again/29331
  environment.systemPackages = with pkgs; [
    git
    btop
    neovim
    spotify
    discord
    slack
    aerospace
    kitty
    syncthing
    jankyborders
    hugo
    multimarkdown
    rust-analyzer
    ripgrep
    flyctl
    fd
    fontconfig
    freetype
    gmp
    shellcheck
    coreutils
   ];

  # The apps installed by homebrew are not managed by nix, and not reproducible!
  # But on macOS, homebrew has a much larger selection of apps than nixpkgs, especially for GUI apps!
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
      # 'zap': uninstalls all formulae(and related files) not listed here.
      # cleanup = "zap";
    };

    taps = [
      "homebrew/services"
    ];

    # `brew install`
    brews = [
      # "aria2"  # download tool
    ];

    # `brew install --cask`
    casks = [
      "scroll-reverser"
      "displaylink"
      "prusaslicer"
      "zen-browser"
    ];
  };
}
