#/usr/env/bin sh

hash=$(curl https://gist.githubusercontent.com/catmeme/64aab8de30d2a65a4d34ea098fba9be9/raw/2d182d3e033544ed9f148426b48e9fbeae7bc6e8/slack-dark.css 2>/dev/null | shasum |awk '{ print $1 }')
 
if grep -q "$hash" dark-theme.js; then
    cat dark-theme.js | sudo tee -a /Applications/Slack.app/Contents/Resources/app.asar.unpacked/src/static/ssb-interop.js
else
    echo "shasum doens't match, exiting"
    exit 1
fi

