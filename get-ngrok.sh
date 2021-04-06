#!/bin/sh

# set -x

os_type=$(uname -s)
arch_type=$(uname -m)

# linux x86_64 => linux_am64
# linux ARMV7L => linux_arm
# linux armhf => linux_arm
# linux arm64 => linux_arm64

# TODO need better testing os and arch versions

if [[ "linux" == "${os_type,,}" ]]; then
    echo "os linux"
    if [[ "x86_64" == "${arch_type,,}" ]] || [[ "amd64" == "${arch_type,,}" ]]; then
        echo "amd64 arch"
        ngrok_url="https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip"
    elif [[ "arm64" == "${arch_type,,}" ]]; then
        echo "arm64 arch"
        ngrok_url="https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm64.zip"
    elif [[ "armhf" == "${arch_type,,}" ]] || [[ "armv7l" == "${arch_type,,}" ]]; then
        echo "arm arch"
        ngrok_url="https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip"
    fi
    echo "download ngrok from: ${ngrok_url}"
    curl -fSL --progress-bar $ngrok_url -o ngrok.zip
    unzip ngrok.zip

    mv ngrok /usr/local/bin/ngrok
    rm -f ngrok.zip
else

    echo "cannot use this script on other os than linux. Please submit PR on https://github.com/MkLHX/get-ngrok"

fi

