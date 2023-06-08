git clone --depth 1 https://github.com/neovim/neovim --branch $TARGET /usr/src/neovim && \
  cd /usr/src/neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo && \
  make install;