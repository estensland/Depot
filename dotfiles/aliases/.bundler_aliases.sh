# Bundler Aliases

# alias b="bundle"
# alias bi="b install --path vendor"
# alias be="bundle exec"
# alias bl="bundle list"
# alias bu="bundle update"
# alias bp="bundle package"

batch_alias_create  \
"b:bundle" \
"bi:bundle install --path vendor" \
"be:bundle exec" \
"bl:bundle list" \
"bu:bundle update" \
"bp:bundle package" 

bundler-help () {
  echo "Bundler Aliases"
  echo
  echo " b     = bundle"
  echo " bi    = bundle install --path vendor"
  echo " be    = bundle exec"
  echo " bl    = bundle list"
  echo " bu    = bundle update"
  echo " bp    = bundle package"
  echo
}
