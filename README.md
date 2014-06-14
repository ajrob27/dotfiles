# albertogg dotfiles.

## Installation instructions

Dependencies needed for the installation.

- git
- tmux (not a dep, but awesome)
- reattach-to-user-namespace (use pbcopy in tmux)
- ruby rake
- coreutils (not a dep, but very useful)

Simply clone the repo.

```sh
$ git clone https://github.com/albertogg/dotfiles.git
```

After that, initialize and update de submodule.

```sh
$ git submodule init
$ git submodule update
```

Let's put everything in place so it works as it should.

```sh
$ rake install
```

Running the script will link every file to it's correct place. Every file with
*.symlink* termination will be linked to your HOME directory and files with *.zsh*
ending will be linked to .oh-my-zsh/custom folder.

## OS X

If you want to install my OS X settings just run the script inside the system
folder.

```sh
$ sh osx.sh
```

## Hombrew

To install my default homebrew apps (git, coreutils, tree, rbenv, tmux, etc...)
use this command:

```sh
$ brew bundle /path/to/Brewfile
```

* * *
## iTerm.

I use my custom iTerm2 configuration. To use my configuration open iTerm2
*Preferences > General tab, click the [x] load preferences from custom folder* and
put the direction to the folders configuration.

## License

[MIT License][mit]

## Thanks

I decided to work on my personal dotfiles after watching holman dotfiles a while back. I
also stole his Rakefile. Also to mathiasbynens for his amazing osx.sh
customizations.

[mit]: https://github.com/albertogg/dotfiles/blob/master/LICENSE
