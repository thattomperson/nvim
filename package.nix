{
  pkgs,
  ...
}: pkgs.writeShellApplication {
  name = "nvim";
  runtimeInputs = with pkgs; [
    lazygit
    fzf
    ripgrep
    fd
    curl
    zig
    cursor-cli
    php83
    nodejs
    git-town
  ];
  runtimeEnv = {
    NVIM_APPNAME = "thattomperson-nvim";
  };
  text = ''
    rm -r "''$HOME/.config/''$NVIM_APPNAME";
    ln -s ${./nvim} "''$HOME/.config/''$NVIM_APPNAME";
    exec ${pkgs.lib.getExe pkgs.neovim} "$@";
  '';
}
