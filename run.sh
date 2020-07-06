# Update
sudo apt update
sudo apt upgrade -y

# Install dependencies.
sudo apt -y install git cmake make autoconf libtool libpcap-dev libglib2.0-dev libgcrypt-dev bison flex qttools5-dev qttools5-dev-tools libqt5svg5-dev qtmultimedia5-dev gettext libssh-dev liblua5.2-dev

# Get wireshark
wget https://2.na.dl.wireshark.org/src/wireshark-3.2.5.tar.xz
tar xJf wireshark-3.2.5.tar.xz
mkdir build
cd build

# Build wireshark
cmake ../wireshark-3.2.5
make
sudo make install

# Nav source root
cd ../

# Get nDPI
git clone https://github.com/ntop/nDPI.git nDPI
cd nDPI

# Build nDPI
./autogen.sh
./configure
make

# Install to Wireshark Dirs.
sudo cp example/ndpiReader /usr/local/lib/wireshark/extcap
sudo cp wireshark/ndpi.lua /usr/local/lib/wireshark/plugins/3.2