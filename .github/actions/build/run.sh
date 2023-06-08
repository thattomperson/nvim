git clone --depth 1 https://github.com/neovim/neovim --branch $TARGET && \
  cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo && \
  make install;