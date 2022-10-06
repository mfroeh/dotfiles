brew services stop yabai
brew upgrade yabai
sudo rm /private/etc/sudoers.d/yabai
echo "${USER} ALL = (root) NOPASSWD: sha256:$(shasum -a 256 $(which yabai)) --load-sa" | sudo tee /private/etc/sudoers.d/yabai
brew services start yabai
