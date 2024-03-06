#! /usr/bin/env bash

# Create a system user and group to run monerod
# sudo addgroup --system monero
# sudo adduser --system --home /var/lib/monero --ingroup monero --disabled-login monero

# Create necessary directories for monerod
# sudo mkdir /var/run/monero
# sudo mkdir /var/log/monero
# sudo mkdir /etc/monero
# sudo mkdir -p /var/lib/monero/.bitmonero

# Create monerod config file
# sudo touch /etc/monero/monerod.conf

# Set permissions for new directories
# sudo chown monero:monero /var/run/monero
# sudo chown monero:monero /var/log/monero
# sudo chown -R monero:monero /etc/monero
# sudo chown -R monero:monero /var/lib/monero

# Download according to 
# https://gist.githubusercontent.com/sethforprivacy/ad5848767d9319520a6905b7111dc021/raw/download_monero_binaries.sh
# First get binaryfate's GPG key
wget -q -O binaryfate.asc https://raw.githubusercontent.com/monero-project/monero/master/utils/gpg_keys/binaryfate.asc

# Verify binaryfate's GPG key
echo "Verify binaryfate's GPG key: "
gpg --keyid-format long --with-fingerprint binaryfate.asc
echo
gpg --import binaryfate.asc

# Delete stale .bz2 Monero downloads
rm -f monero-linux-x64-*.tar.bz2

# Download hashes.txt
wget -q -O hashes.txt https://getmonero.org/downloads/hashes.txt

# Verify hashes.txt
echo
echo "--------------------"
echo "Verify hashes.txt"
gpg --verify hashes.txt

# Download latest 64-bit binaries
echo
echo "-------------------------------------"
echo "4. Download latest Linux binaries"
echo "Downloading..."
wget -q --content-disposition https://downloads.getmonero.org/cli/linux64

# Verify shasum of downloaded binaries
echo
echo "---------------------------------------"
echo "Verify hashes of downloaded binaries"
if shasum -a 256 -c hashes.txt -s --ignore-missing
then
        echo
        echo "Success: The downloaded binaries verified properly!"
else
        echo
        echo -e "\e[31mDANGER: The download binaries have been tampered with or corrupted\e[0m"
        rm -rf monero-linux-x64-*.tar.bz2
        exit 1
fi


tar xvf monero-linux-*.tar.bz2
rm monero-linux-*.tar.bz2
sudo cp -r monero-x86_64-linux-gnu-*/* /usr/local/bin/
sudo chown -R monero:monero /usr/local/bin/monero*

