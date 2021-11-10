#------------------------------------------------------
#!/bin/bash
#Filename: Volatility-Install-Debian
#Version: 1.0
#Creation: Nov 2021
#Author: TheProtag0nist

#ECHO FORMATTING
RESET=$(tput sgr0) # Text reset
BOLD=$(tput bold)

ERROR=$(tput setaf 1) # Red
WARN=$(tput setaf 3) # Yeloow
OK=$(tput setaf 2) # Green
INFO=$(tput setaf 4) # Blue
#------------------------------------------------------

# Creates directory for program/installation files.
sudo mkdir Volatility-Install-Debian-Beta 
cd Volatility-Install-Debian-Beta
echo "${BOLD}${INFO}Directory created in Downloads.${RESET}"

# Grabbing all Volatility 2 Dependencies
echo "${BOLD}${INFO}Beginning Stage 1: Installing system dependencies...${RESET}"
	sudo apt install -y build-essential git libdistorm3-dev yara libraw1394-11 libcapstone-dev capstone-tool tzdata
echo "${BOLD}${OK}End of Stage 1.${RESET}"

# Installing Pip for Python2 (Required for setting up modules)
echo "${BOLD}${INFO}Beginning Stage 2: Preparing Pip.${RESET}"
	sudo apt install -y python2 python2.7-dev libpython2-dev python2-dev
	sudo curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py
	sudo python2 get-pip.py
	sudo python2 -m pip install -U setuptools wheel
	sudo pip2 install --upgrade setuptools 
echo "${BOLD}${OK}End of Stage 2. Pip is ready to go!${RESET}"

#Sets up included modules
echo "${BOLD}${INFO}Beginning Stage 3: Modules.${RESET}"
	echo "${BOLD}${INFO}Setting up included modules${RESET}"
	echo "${BOLD}${WARN}Only distorm3 & pycrypto are included in this version of the script.${RESET}"
	sudo python2 -m pip install -U distorm3 pycrypto
echo "${BOLD}${OK}End of Stage 3.${RESET}"

# Downloads Volatility2
echo "${BOLD}${INFO}Beginning Stage 4: Setting up Volatility.${RESET}"
	echo "${BOLD}${INFO}Downloading Volatility 2.${RESET}"
	sudo git clone https://github.com/volatilityfoundation/volatility
	echo "${BOLD}${OK}Volatility2 Downloaded.${RESET}"

#Installing Volatility
	echo "${BOLD}${INFO}Beginning Volatility package installation...${RESET}"
	cd volatility
	sudo python setup.py install
echo "${BOLD}${OK}End of Stage 4.${RESET}"

echo "${BOLD}${OK}Volatility installation complete.${RESET}"
echo "${BOLD}Use the following command to see all flags & options: vol.py -h${RESET}"