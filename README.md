# config
Dot Files for various machines
This has been adapted from https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/

To get started
1. Create a config temp alias
    alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
2. Create barebone git repo
    git clone --bare <git-repo-url> $HOME/src/config
3. Checout
    config checkout
