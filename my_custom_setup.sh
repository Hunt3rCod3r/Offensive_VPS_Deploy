#!/bin/bash

mkdir -p ~/tools
mkdir -p ~/tools/wordlists
mkdir -p ~/tools/recon
mkdir -p ~/tools/exploitation
wget https://gist.githubusercontent.com/nullenc0de/96fb9e934fc16415fbda2f83f08b28e7/raw/146f367110973250785ced348455dc5173842ee4/content_discovery_nullenc0de.txt -O ~/tools/wordlists/content_discovery_nullenc0de.txt &&
wget https://gist.githubusercontent.com/nullenc0de/538bc891f44b6e8734ddc6e151390015/raw/a6cb6c7f4fcb4b70ee8f27977886586190bfba3d/passwords.txt -O ~/tools/wordlists/passwords.txt &&
wget https://gist.githubusercontent.com/jhaddix/86a06c5dc309d08580a018c66354a056/raw/96f4e51d96b2203f19f6381c8c545b278eaa0837/all.txt -O ~/tools/wordlists/JHaddix_all.txt &&
wget https://gist.githubusercontent.com/nullenc0de/9cb36260207924f8e1787279a05eb773/raw/0197d33c073a04933c5c1e2c41f447d74d2e435b/params.txt -O  ~/tools/wordlists/params.txt &&
wget https://gist.githubusercontent.com/nullenc0de/e9d1f2a8a0a38c9bfcb5bdb9fc7191ea/raw/e2ed8116a35a13afac9ba2011c6afd2bc78aed45/apk_relative_links.txt -O ~/tools/wordlists/apk_relative_links.txt &&
wget https://gist.githubusercontent.com/nullenc0de/be4d0ac216ee4fecab5493555089b28d/raw/f79519efba32de9085f922456070b3dfb647ec9f/apk_params.txt -O ~/tools/wordlists/apk_params.txt &&
wget https://gist.githubusercontent.com/nullenc0de/21bb5f3927403a9c2a108c0af8380402/raw/5137b60df4f17abdc43b183c2e02022fe8d8374e/resolvers.txt -O ~/tools/wordlists/resolvers.txt &&
wget https://gist.githubusercontent.com/nullenc0de/649ff70b71f925c1d57e66f554b2b9da/raw/e28a060bf28d229b9a7d375d9216521934520dd9/interesting_dirsearch.txt -O ~/tools/wordlists/interesting_dirsearch.txt &&
wget https://gist.githubusercontent.com/nullenc0de/c01103200ab766ef11e3259fab5f0c1c/raw/5880df636d0e8c4ae9e72553cebc56ef9435ac00/interesting_content.txt -O ~/tools/wordlists/interesting_content.txt  &&

git clone --depth 1 https://github.com/danielmiessler/SecLists.git ~/tools/wordlists/secLists &&
git clone https://github.com/Hunt3rCod3r/WordList.git ~/tools/wordlists/godFatherOrwa &&

# Add directories to PATH
# /home/ubuntu/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
echo "export PATH=$PATH:$HOME/tools:$HOME/go/bin" >> ~/.bashrc
source ~/.bashrc &&

#update, utils, lib...
sudo apt update &&
sudo apt install python3.9-venv libxml2 libxml2-dev libz-dev libxslt1-dev python3-dev -y &&
sudo apt install libcurl4-openssl-dev libpcre3-dev libssh-dev libpcap-dev jq -y &&

#Brutespray
sudo apt install brutespray -y &&

#sqlmap
sudo apt install sqlmap -y &&

# Nmap
sudo apt install nmap -y &&

# Masscan
sudo apt install masscan -y &&

# FINDOMAIN
wget https://github.com/Edu4rdSHL/findomain/releases/latest/download/findomain-linux -O ~/tools/recon/findomain &&
chmod +x ~/tools/recon/findomain

# # DNSGEN
pip3 install dnsgen &&
ln -s ~/.local/bin/dnsgen ~/tools/recon

#commix
git clone https://github.com/commixproject/commix.git ~/tools/exploitation/commix &&

# Gobuster
go install -v github.com/OJ/gobuster/v3@latest &&

# Amass
go install -v github.com/OWASP/Amass/v3/...@master &&

### TomNomNom ###
go install -v github.com/tomnomnom/qsreplace@latest &&
go install -v github.com/tomnomnom/gf@latest &&
go install -v github.com/tomnomnom/waybackurls@latest &&
go install -v github.com/tomnomnom/assetfinder@latest &&
go install -v github.com/tomnomnom/httprobe@latest &&
go install -v github.com/tomnomnom/anew@latest &&
go install -v github.com/tomnomnom/hacks/kxss@latest &&
go install -v github.com/tomnomnom/hacks/filter-resolved@latest &&
go install -v github.com/tomnomnom/hacks/unfurl@latest &&
go install -v github.com/tomnomnom/hacks/anti-burl@latest &&
go install -v github.com/tomnomnom/hacks/get-title@latest &&
go install -v github.com/tomnomnom/hacks/tok@latest &&
go install -v github.com/tomnomnom/hacks/fff@latest &&

# Hakrawler
go install -v github.com/hakluke/hakrawler@latest &&

# Gau
go install -v github.com/lc/gau/v2/cmd/gau@latest &&

# ProjectDiscovery
GO111MODULE=on go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest &&
go install -v github.com/projectdiscovery/shuffledns/cmd/shuffledns@latest &&
go install -v github.com/projectdiscovery/httpx@latest &&
go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest &&
go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest &&
go install -v github.com/projectdiscovery/interactsh/cmd/interactsh-client@latest &&
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest &&

# ffuf
go install -v github.com/ffuf/ffuf@latest &&

# Gospider
go install -v github.com/jaeles-project/gospider@latest &&


# Gowitness
go install -v github.com/sensepost/gowitness@latest &&

#Kadimus
git clone https://github.com/P0cL4bs/kadimus.git ~/tools/exploitation/kadimus &&
cd tools/exploitation/kadimus
make &&
cd ~

# Arjun
# git clone https://github.com/s0md3v/Arjun.git /opt/Arjun
# chmod +x /opt/Arjun/arjun.py
pip3 install arjun &&
ln -s ~/.local/bin/arjun ~/tools/recon

# Linkfinder
git clone https://github.com/GerbenJavado/LinkFinder.git ~/tools/recon/LinkFinder &&
cd tools/recon/LinkFinder
sudo python3 setup.py install &&
cd ~

source ~/.bashrc

#crackMapExec
# python3 -m pip install pipx &&
# pipx ensurepath &&
# pipx install crackmapexec &&

#Snp13r
# git clone https://github.com/1N3/Sn1per ~/tools/recon/Sn1per &&
# cd tools/recon/Sn1per
# sudo bash install.sh &&
# cd ~
