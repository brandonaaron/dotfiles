function zip_r {
  # $1 files
  if [ ! $# -ge 1 ]
    then echo "please supply file args. example: 'zip_r files-or-dirs-to-recursively-include-*'"
  else
    local outfilepath="zip_$(date +%s%N | cut -b1-13).zip"
    time zip -r -9 -X "$outfilepath" $@ \
      --exclude '*.DS_Store' # '*.log' '*/node_modules*' '*/.git*' '*/.cache*' '*/.vagrant*'
    echo "zip created: $(pwd)/$outfilepath"
  fi
}
