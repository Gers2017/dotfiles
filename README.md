##

```bash
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

```bash
echo ".cfg" >> .gitignore # ignore .cfg directory
```

```bash
git clone --bare https://github.com/Gers2017/dotfiles.git $HOME/.cfg
```

```bash
config checkout
```

```bash
config config --local status.showUntrackedFiles no
```
