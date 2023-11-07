{ config, pkgs, lib, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "afonso";
  home.homeDirectory = "/home/afonso";
  nixpkgs.config = {
   allowUnfree = true;
   }; 
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  
  home.packages = [
   pkgs.alacritty
   pkgs.steam
   pkgs.brave
   pkgs.spotify
   pkgs.vim
   pkgs.neovim
   pkgs.lf
   pkgs.discord
   pkgs.zip
   pkgs.unzip
   pkgs.wget
   pkgs.git
   pkgs.zsh
   pkgs.oh-my-zsh
   pkgs.zsh-powerlevel10k
   pkgs.python311Packages.pip
   pkgs.thefuck
   pkgs.wine
   pkgs.appimage-run
   pkgs.fuse
   pkgs.prismlauncher
   pkgs.killall
   pkgs.nerdfonts
 ];
  programs.zsh = {
   enable = true;
   shellAliases = {
    vim = "nvim";
   };

   plugins = [
   {
     name = "powerlevel10k";
     src = pkgs.zsh-powerlevel10k;
     file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
   }
   {
     name = "powerlevel10k-config";
     src = ./p10k-config;
     file = "p10k.zsh";
   }
   ];
#   oh-my-zsh = {
#   enable = true;
#   plugins = [ "git" "thefuck"];
#   theme = "half-life";
#    };
   };
 home.sessionVariables = {
  # EDITOR = "vim";
 };
 
}
