all: sync

sync:  
	[[ -f ~/.bashrc        ]] || ln -s $(realpath Dotfiles/bash/bashrc.main) ~/.bashrc
	[[ -f ~/.tmux.conf     ]] || ln -s $(realpath Dotfiles/tmux/tmux.conf) ~/.tmux.conf
	[[ -f ~/.vimrc         ]] || ln -s $(realpath Dotfiles/vim/vimrc) ~/.vimrc
	[[ -f ~/.gitconfig     ]] || ln -s $(realpath Dotfiles/git/gitconfig) ~/.gitconfig
	[[ -f ~/.git-prompt.sh ]] || ln -s $(realpath Dotfiles/git/git-prompt.sh) ~/.git-prompt.sh
	[[ -f /usr/bin/e       ]] || ln -s $(realpath Binaries/e) /usr/bin/e
	[[ -f /usr/bin/extract ]] || ln -s $(realpath Binaries/extract) /usr/bin/extract
	[[ -f /usr/bin/ftext   ]] || ln -s $(realpath Binaries/ftext) /usr/bin/ftext
	[[ -f /usr/bin/pwdtail ]] || ln -s $(realpath Binaries/pwdtail) /usr/bin/pwdtail

sync-df:
	[[ -f ~/.bashrc        ]] || ln -s $(realpath Dotfiles/bash/bashrc.main) ~/.bashrc
	[[ -f ~/.tmux.conf     ]] || ln -s $(realpath Dotfiles/tmux/tmux.conf) ~/.tmux.conf
	[[ -f ~/.vimrc         ]] || ln -s $(realpath Dotfiles/vim/vimrc) ~/.vimrc
	[[ -f ~/.gitconfig     ]] || ln -s $(realpath Dotfiles/git/gitconfig) ~/.gitconfig
	[[ -f ~/.git-prompt.sh ]] || ln -s $(realpath Dotfiles/git/git-prompt.sh) ~/.git-prompt.sh

sync-bin:
	[[ -f /usr/bin/e       ]] || ln -s $(realpath Binaries/e) /usr/bin/e
	[[ -f /usr/bin/extract ]] || ln -s $(realpath Binaries/extract) /usr/bin/extract
	[[ -f /usr/bin/ftext   ]] || ln -s $(realpath Binaries/ftext) /usr/bin/ftext
	[[ -f /usr/bin/pwdtail ]] || ln -s $(realpath Binaries/pwdtail) /usr/bin/pwdtail

clean: 
	rm -f ~/.bashrc
	rm -f ~/.tmux.conf
	rm -f ~/.vimrc
	rm -f ~/.gitconfig
	rm -f ~/.git-prompt.sh
	rm -f /usr/bin/e
	rm -f /usr/bin/extract
	rm -f /usr/bin/ftext 
	rm -f /usr/bin/pwdtail

clean-df:
	rm -f ~/.bashrc
	rm -f ~/.tmux.conf
	rm -f ~/.vimrc
	rm -f ~/.gitconfig
	rm -f ~/.git-prompt.sh

clean-bin:
	rm -f /usr/bin/e
	rm -f /usr/bin/extract
	rm -f /usr/bin/ftext 
	rm -f /usr/bin/pwdtail

.PHONY: all sync sync-df sync-bin clean clean-df clean-bin
