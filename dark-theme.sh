#/usr/env/bin sh

hash=$(curl https://raw.githubusercontent.com/catmeme/slack-patches/master/dark-theme.css 2>/dev/null | shasum |awk '{ print $1 }')
 
if grep -q "$hash" dark-theme.js; then
    cat dark-theme.js | sudo tee -a /Applications/Slack.app/Contents/Resources/app.asar.unpacked/src/static/ssb-interop.js
else
    echo "shasum doens't match, exiting"
    exit 1
fi

