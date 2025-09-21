# MUST be in same directory as script when running

apt update
apt upgrade -y

sudo apt install -y neovim
sudo apt install -y git
sudo apt install -y cmake
sudo apt install -y universal-ctags
sudo apt install -y vulkan-tools
sudo apt install -y vulkan-validationlayers
sudo apt install -y glslang-tools
sudo apt install -y libglfw3-dev
sudo apt install -y trash-cli
sudo apt install -y steam
sudo apt install -y calibre
sudo apt install -y mint-meta-codecs

flatpak install -y com.discordapp.Discord
flatpak install -y com.google.Chrome

# Loads desktop settings
dconf load / < dconf-settings
# Run the following to save settings
# dconf dump / > dconf-settings

# Git config settings
git config --global user.name "Evan Gyori"
git config --global user.email "evangyori@gmail.com"
git config --global core.editor nvim
git config --global alias.history "log --all --oneline --graph"

# Install latest Dotnet LTS release, move to appropiate location, and put location in PATH and DOTNET_ROOT env variables
wget https://dot.net/v1/dotnet-install.sh -O "$HOME/Downloads/dotnet-install.sh"
chmod +x "$HOME/Downloads/dotnet-install.sh"
mkdir -p "$HOME/ManualInstalls/Software/Console/Dotnet"
"$HOME/Downloads/dotnet-install.sh" --install-dir "$HOME/ManualInstalls/Software/Console/Dotnet"
trash "$HOME/Downloads/dotnet-install.sh"

# Install C# Godot v4.3, move to appropiate location, and put location in PATH evn variable
mkdir -p "$HOME/ManualInstalls/Apps/Godot"
wget https://github.com/godotengine/godot/releases/download/4.3-stable/Godot_v4.3-stable_mono_linux_x86_64.zip -O "$HOME/Downloads/godot.zip"
unzip "$HOME/Downloads/godot.zip" -d "$HOME/ManualInstalls/Apps/Godot"
mv "$HOME/ManualInstalls/Apps/Godot/Godot_v4.3-stable_mono_linux_x86_64/Godot_v4.3-stable_mono_linux.x86_64" "$HOME/ManualInstalls/Apps/Godot/godot"
mv "$HOME/ManualInstalls/Apps/Godot/Godot_v4.3-stable_mono_linux_x86_64/GodotSharp" "$HOME/ManualInstalls/Apps/Godot/GodotSharp"
trash "$HOME/Downloads/godot.zip"
trash "$HOME/ManualInstalls/Apps/Godot/Godot_v4.3-stable_mono_linux_x86_64"

# Setup environment variables.
cp .profile "$HOME/.profile"

# Not used since it does not allow this script to be run multiple times
# printf "\nDOTNET_ROOT=\"\$HOME/ManualInstalls/Software/Console/Dotnet\"\n" >> "$HOME/.profile"
# printf "\nPATH=\"\$PATH:\$DOTNET_ROOT\"\n" >> "$HOME/.profile"
# printf "\nPATH=\"\$PATH:\$HOME/ManualInstalls/Apps/Godot\"\n" >> "$HOME/.profile"

# Delete unnecessary folders included with install
trash "$HOME/Pictures"
trash "$HOME/Music"
trash "$HOME/Templates"
trash "$HOME/Videos"
trash "$HOME/Public"
trash "$HOME/Documents"

# Setup neovim plugins and settings
mkdir -p "$HOME/.config/nvim"
cp ../shared/init.vim "$HOME/.config/nvim/init.vim"
mkdir -p "$HOME/.local/share/nvim/site/autoload"
cp ../shared/plug.vim "$HOME/.local/share/nvim/site/autoload/plug.vim"

# Create ssh key and display the public key in console to be put into Github by user
printf "\n\n\n" | ssh-keygen
cat "$HOME/.ssh/id_rsa.pub"
