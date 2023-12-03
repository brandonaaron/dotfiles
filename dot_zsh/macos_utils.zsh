# Show human friendly numbers and colors
alias df='df -h'
alias du='du -h -d 2'

function hide_desktop_icons {
  defaults write com.apple.finder CreateDesktop -bool FALSE
  killall Finder
}

function show_desktop_icons {
  defaults write com.apple.finder CreateDesktop -bool TRUE
  killall Finder
}
