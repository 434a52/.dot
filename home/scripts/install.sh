sudo apt update && sudo apt full-upgrade -y

function install {
  which $2 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1} ${2}"
    if [ $1 -eq "apt" ]; then
      sudo apt install -y $1
    elif [ $1 -eq "snap" ]; then
      sudo snap install -y $1
    fi
  fi
}

# Basics
install apt  curl
install apt  wget
install apt  git
install apt  htop
install apt  nmap
install snap tree
install apt  micro

# Fun stuff
install figlet
install lolcat

# Get all upgrades
sudo apt upgrade -y
sudo apt autoremove -y
