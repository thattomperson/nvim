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
    gcc
  ];
  runtimeEnv = {
    NVIM_APPNAME = "thattomperson-nvim";
    PHPCSFIXER_CONFIG = ../.php-cs-fixer.php;
  };
  text = ''
    export NVIM_CONFIG_PATH="$HOME/.config/$NVIM_APPNAME";
    export LG_CONFIG_FILE="$NVIM_CONFIG_PATH/lazygit.yml";
    mkdir -p "$NVIM_CONFIG_PATH";

    # Delete all existing symlinks
    find "$NVIM_CONFIG_PATH" -maxdepth 1 -type l -delete

    # Symlink all the files in the nvim folder to the config path
    find ${../nvim} -maxdepth 1 ! -path ${../nvim} -print0 | xargs -0 -n1 basename | xargs -I{} ln -s "${../nvim}/{}" "$NVIM_CONFIG_PATH/{}";

    exec ${pkgs.lib.getExe pkgs.neovim} "$@";
  '';
}
