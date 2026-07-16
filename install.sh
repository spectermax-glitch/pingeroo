#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INSTALLPATH="${HOME}/.local/bin"


echo "Installing pingeroo to $INSTALLPATH"

if [[ ! -d $INSTALLPATH ]]; then
  echo "creating directory"
  mkdir -p $INSTALLPATH
fi

if [[ $PATH =~ $INSTALLPATH ]];then
  echo "install directory in PATH"
  extra=""
else
  echo "adding install directory to PATH"  
  echo "export PATH=\"${PATH}:${INSTALLPATH}\"" >> ${HOME}/.zshrc
  extra="run source ~/.zshrc to update PATH (future logins you don't need to)"
fi

echo "copying pingeroo to $INSTALLPATH"
cp ${SCRIPT_DIR}/pingeroo ${INSTALLPATH}
if [[ $? -eq 0 ]]; then
    echo -e "\e[1;32mSuccess\e[0m"
    echo "install complete.  you can remove $SCRIPT_DIR"
    echo $extra
    echo
    echo "Usage:  pingeroo 8.8.8.8 &"
else
    echo -e"\e[1;33mfailed to copy.  not installed!\e[0m"
fi

