#!/usr/bin/env bash
DEBIAN_FRONTEND=noninteractive
GRUB_UPSTREAM_SRC="https://git.savannah.gnu.org/git/grub.git"
GRUB_CHERRY_PICK="a6838bbc6726ad624bd2b94991f690b8e9d23c69"
DEB_BUILD_OPTIONS=nocheck 
GIT_USER_NAME="Peter Pouliot"
GIT_USER_EMAIL="ppouliot@amperecomputing.com"

source /ENVIRONMENT
export $DEBIAN_FRONTEND
export $DEB_BUILD_OPTIONS

echo "DEB_GRUB_SRC: " ${DEB_GRUB_SRC}
echo "DEB_GRUB_BRANCH: " ${DEB_GRUB_BRANCH}

mkdir -p /output/${DEB_GRUB_BRANCH}

sed -i -- 's/# deb-src/deb-src/g' /etc/apt/sources.list 

ln -snf /usr/share/zoneinfo/$(curl https://ipapi.co/timezone) /etc/localtime

apt-get update -y
#apt-get install -y --no-install-recommends git build-essential cdbs devscripts equivs fakeroot flex bison help2man texinfo xfonts-unifont libfreetype6-dev libdevmapper-dev libsdl1.2-dev xorriso parted libfuse-dev fonts-dejavu-core liblzma-dev dosfstools mtools wamerican pkg-config bash-completion libefiboot-dev libefivar-dev python ttf-dejavu-core 
apt-get install -y --no-install-recommends -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" ${PACKAGES}
apt-get clean 
rm -rf /tmp/* /var/tmp/*
git clone --branch ${DEB_GRUB_BRANCH} ${DEB_GRUB_SRC} /tmp/grub 
cd /tmp/grub 
git branch -l 
git config user.name ${GIT_USER_NAME} 
git config user.email ${GIT_USER_EMAIL} 
git remote add upstream ${GRUB_UPSTREAM_SRC} 
git fetch upstream 
git cherry-pick ${GRUB_CHERRY_PICK} 
dpkg-buildpackage -rfakeroot -b
cd /tmp
mv *.deb /output/${DEB_GRUB_BRANCH}/
