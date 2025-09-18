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
    tree-sitter
    clang_16
  ];
  runtimeEnv = {
    NVIM_APPNAME = "thattomperson-nvim";
  };
  text = ''
    export LG_CONFIG_FILE="$HOME/.config/$NVIM_APPNAME/lazygit.yml";
    mkdir -p "''$HOME/.config/''$NVIM_APPNAME";
    rm -rf "''$HOME/.config/''$NVIM_APPNAME/lua" || true;
    rm  "''$HOME/.config/''$NVIM_APPNAME/init.lua" || true;
    rm  "''$HOME/.config/''$NVIM_APPNAME/lazygit.yml" || true;
    ln -s ${./nvim/lua} "''$HOME/.config/''$NVIM_APPNAME/lua";
    ln -s ${./nvim/init.lua} "''$HOME/.config/''$NVIM_APPNAME/init.lua";
    ln -s ${./nvim/lazygit.yml} "''$HOME/.config/''$NVIM_APPNAME/lazygit.yml";
    exec ${pkgs.lib.getExe pkgs.neovim} "$@";
  '';
}
