function check_for_broken_links {
  # $1 host
  if [ "$#" -ne 1 ]
    then echo 'usage: `check_for_broken_links site.dev`'
  else
    wget --spider -e robots=off --wait=0 --recursive \
      --directory-prefix=/tmp --page-requisites $1 2>&1 \
      | grep -A999 -e 'refused' -e 'broken link' \
      | grep -e '^Found' -e '^http' -e 'failed'
  fi
}
