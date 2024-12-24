# update google's keyring
curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --yes --dearmor -o /usr/share/keyrings/cloud.google.gpg

# update kubernete's keyring and minor version
minor_version=1.32
curl -fsSL https://pkgs.k8s.io/core:/stable:/v$minor_version/deb/Release.key | sudo gpg --yes --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v$minor_version/deb/ /" | sudo tee /etc/apt/sources.list.d/kubernetes.list > /dev/null

# update system apps
sudo apt update && sudo apt upgrade -y
sudo snap refresh

# update python
poetry self update
pyenv update

# update rust
rustup update

# update apps installed with cargo
cargo install alacritty exa procs bat