
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

cp pingeroo $INSTALLPATH

echo "install complete.  you can remove the pingeroo folder."
echo $extra
echo
echo "Usage:  pingeroo 8.8.8.8 &"

