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
  ];
  runtimeEnv = {
    NVIM_APPNAME = "thattomperson-nvim";
  };
  text = ''
    exec ${pkgs.lib.getExe pkgs.neovim} -u ${./nvim}/init.lua --cmd "set runtimepath+=${./nvim}"
  '';
}
