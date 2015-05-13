# URL Aliases

# Static

alias goexer='open http://www.exercism.io/estensland'
alias goeuler='open http://projecteuler.net/problems'
alias gogit='open http://www.github.com/estensland'

# Dynamic

gorepo() {
  URL=$(git --git-dir=.git config --get remote.origin.url | sed -e 's/\:/\//')
  URL=$(awk '{gsub(/git@/,"https://www.")}1' <<< $URL)
  open "$URL"
}

url-help () {
  echo "Url Aliases"
  echo
  echo " Static"
  echo " gogit    = open http://www.github.com/estensland"
  echo " goexer   = open http://www.exercism.io/estensland"
  echo " goeuler  = open http://projecteuler.net/problems"
  echo " gosoc    = open http://www.gmail.com && open http://www.facebook.com && open http://www.twitter.com"
  echo
  echo " Dynamic"
  echo " gorepo   = open 'current repo url'"
  echo
  echo
}
