#!/usr/bin/env bash

rm -rf app*.asar*
docker build . -t slack-patches/asar
sudo cp /Applications/Slack.app/Contents/Resources/app.asar .
sudo cp -R /Applications/Slack.app/Contents/Resources/app.asar.unpacked .
sudo chown -R $USER app.asar*
docker run --rm -it -v $(PWD):/app/ slack-patches/asar extract app.asar app.asar.unpacked
cat dark-theme.js | tee -a app.asar.unpacked/dist/ssb-interop.bundle.js
sed -ie "s@//# sourceMappingURL=ssb-interop.bundle.js.mapdocument.addEventListener('DOMContentLoaded', function() {@document.addEventListener('DOMContentLoaded', function() {@" app.asar.unpacked/dist/ssb-interop.bundle.js
docker run --rm -it -v $(PWD):/app/ slack-patches/asar pack app.asar.unpacked app2.asar
sudo cp -v app2.asar /Applications/Slack.app/Contents/Resources/app.asar
sudo sed -ie 's/"bootSonic":"always"/"bootSonic":"never"/' ~/Library/Containers/com.tinyspeck.slackmacgap/Data/Library/Application\ Support/Slack/local-settings.json
