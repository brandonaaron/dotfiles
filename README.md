## Adding VIM Plugins

In the chezmoi working directory run the following

```
git submodule add https://github.com/vim-airline/vim-airline dot_vim/pack/vendor/start/vim-airline
git add .gitmodules dot_vim/pack/vendor/start/vim-airline
chezmoi apply
```
