bindkey -v                                          # Use vi key bindings

# History substring search bindings
bindkey '^[[A' history-substring-search-up          # Up arrow
bindkey '^[[B' history-substring-search-down        # Down arrow
bindkey '^r' history-substring-search-up            # Ctrl+R for consistency
bindkey -M vicmd 'k' history-substring-search-up    # k in vi command mode
bindkey -M vicmd 'j' history-substring-search-down  # j in vi command mode
