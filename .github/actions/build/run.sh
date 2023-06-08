sudo apt-get update && sudo apt-get install -y ninja-build gettext cmake unzip curl;

git clone --depth 1 https://github.com/neovim/neovim --branch $TARGET && \
  cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo && \
  make install;