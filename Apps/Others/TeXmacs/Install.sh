#!/usr/bin/env sh

VERSION="1.99.12-C"
DESTROOT=$HOME/Applications
DESTDIR=$DESTROOT/TeXmacs
LAUNCHDIR=$HOME/.local/share/applications

rm -rf $DESTDIR
if [ ! -d $DESTROOT ]
then
  mkdir -p $DESTROOT
fi

# Get the archive and extract it.
if [ ! -e "/tmp/TeXmacs-$VERSION.tar.gz" ]
then
  echo "Downloading the archive..."
  curl -Rk "https://www.texmacs.org/Download/ftp/tmftp/generic/TeXmacs-$VERSION.tar.gz" -o /tmp/TeXmacs-$VERSION.tar.gz
fi
echo "Extracting the archive..."
tar xfz /tmp/TeXmacs-$VERSION.tar.gz -C /tmp
mv /tmp/TeXmacs*linux-gnu/TeXmacs $DESTDIR

# Get the icon.
echo "Downloading the icon..."
curl -Rk "https://www.texmacs.org/tmweb/images/TeXmacs.png" -o /tmp/TeXmacs.png
cp -f /tmp/TeXmacs.png $DESTDIR/ 

# Copy the script and make it executable.
echo "Creating the launch script..."
echo "\
#!/usr/bin/env sh

export TEXMACS_PATH=\"$DESTDIR\"
export PATH=\"\$TEXMACS_PATH/bin:\$PATH\"
\$TEXMACS_PATH/bin/texmacs &
" > $DESTDIR/TeXmacs.sh
chmod ug+rx $DESTDIR/TeXmacs.sh

# Copy the launcher.
echo "Creating the launcher..."
if [ ! -d $LAUNCHDIR ]
then
  mkdir -p $LAUNCHDIR
fi
echo "
[Desktop Entry]
Version=1.0
NoDisplay=False
Name=TeXmacs
Comment=WYSIWYG TeX math editor
Exec=sh $DESTDIR/TeXmacs.sh %f
Icon=$DESTDIR/TeXmacs.png
StartupNotify=true
Terminal=false
Type=Application
Categories=Education;Math;
" > $LAUNCHDIR/TeXmacs.desktop
chmod ug+rx $LAUNCHDIR/TeXmacs.desktop

