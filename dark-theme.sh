#/usr/env/bin sh

dark_theme() {
    local hash=$(curl https://raw.githubusercontent.com/catmeme/slack-patches/master/dark-theme.css 2>/dev/null | shasum |awk '{ print $1 }')
 
    if grep -q "$hash" dark-theme.js; then
cat dark-theme.js | sudo tee -a /Applications/Slack.app/Contents/Resources/app.asar.unpacked/src/static/ssb-interop.js
    else
        echo "shasum doens't match, exiting"
        exit 1
    fi
}

darkreader() {
    local hash=$(curl https://raw.githubusercontent.com/catmeme/slack-patches/master/darkreader.css 2>/dev/null | shasum |awk '{ print $1 }')
 
    if grep -q "$hash" darkreader.js; then
cat darkreader.js | sudo tee -a /Applications/Slack.app/Contents/Resources/app.asar.unpacked/src/static/ssb-interop.js
    else
        echo "shasum doens't match, exiting"
        exit 1
    fi
}

case $1 in
    'dark_theme')                 shift; dark_theme;;
    'darkreader')                 shift; darkreader;;
    *)                            shift; darkreader;;
esac
