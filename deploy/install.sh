#!/usr/bin/env bash

set -ex

apt-get update

apt_pkgs=(
    build-essential
    git
    htop
    lvm2
    parallel
    python-dev
    python-gdal
    python-pip
    unzip
    libprotobuf-dev
    protobuf-compiler
    libsqlite3-dev
)

# install packages from apt
apt-get install --force-yes -y ${apt_pkgs[@]}

# "Install dependencies"
apt-get install  -y libprotobuf-dev protobuf-compiler libsqlite3-dev

git clone https://github.com/osmlab/osmlint.git
cd osmlint
npm install && npm link
cd ..

git clone https://github.com/Rub21/osmlint-filter.git
cd osmlint-filter
npm install && npm link
cd ..

git clone https://github.com/Rub21/create-tasks-tofix.git
cd create-tasks-tofix
npm install
cd ..