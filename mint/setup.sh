apt update
apt upgrade -y

sudo apt install -y neovim
sudo apt install -y git
sudo apt install -y cmake
sudo apt install -y universal-ctags
sudo apt install -y vulkan-tools
sudo apt install -y trash-cli
sudo apt install -y steam
sudo apt install -y calibre

flatpak install -y com.discordapp.Discord
flatpak install -y com.google.Chrome

git config --global user.name "Evan Gyori"
git config --global user.email "evangyori@gmail.com"
git config --global core.editor nvim

wget https://dot.net/v1/dotnet-install.sh -O "$HOME/Downloads/dotnet-install.sh"
chmod +x "$HOME/Downloads/dotnet-install.sh"
mkdir -p "$HOME/ManualInstalls/Software/Console/Dotnet"
"$HOME/Downloads/dotnet-install.sh" --install-dir "$HOME/ManualInstalls/Software/Console/Dotnet"
trash "$HOME/Downloads/dotnet-install.sh"
printf "\nDOTNET_ROOT=\"\$HOME/ManualInstalls/Software/Console/Dotnet\"\n" >> "$HOME/.profile"
printf "\nPATH=\"\$PATH:\$DOTNET_ROOT\"\n" >> "$HOME/.profile"

mkdir -p "$HOME/ManualInstalls/Apps/Godot"
wget https://github.com/godotengine/godot/releases/download/4.3-stable/Godot_v4.3-stable_mono_linux_x86_64.zip -O "$HOME/Downloads/godot.zip"
unzip "$HOME/Downloads/godot.zip" -d "$HOME/ManualInstalls/Apps/Godot"
mv "$HOME/ManualInstalls/Apps/Godot/Godot_v4.3-stable_mono_linux_x86_64/Godot_v4.3-stable_mono_linux.x86_64" "$HOME/ManualInstalls/Apps/Godot/godot"
mv "$HOME/ManualInstalls/Apps/Godot/Godot_v4.3-stable_mono_linux_x86_64/GodotSharp" "$HOME/ManualInstalls/Apps/Godot/GodotSharp"
printf "\nPATH=\"\$PATH:\$HOME/ManualInstalls/Apps/Godot\"\n" >> "$HOME/.profile"
trash "$HOME/Downloads/godot.zip"
trash "$HOME/ManualInstalls/Apps/Godot/Godot_v4.3-stable_mono_linux_x86_64"

trash "$HOME/Pictures"
trash "$HOME/Music"
trash "$HOME/Templates"
trash "$HOME/Videos"
trash "$HOME/Public"
trash "$HOME/Documents"

mkdir -p "$HOME/.config/nvim"
cp ../shared/init.vim "$HOME/.config/nvim/init.vim"
mkdir -p "$HOME/.local/share/nvim/site/autoload"
cp ../shared/plug.vim "$HOME/.local/share/nvim/site/autoload/plug.vim"

printf "\n\n\n" | ssh-keygen
cat "$HOME/.ssh/id_rsa.pub"
