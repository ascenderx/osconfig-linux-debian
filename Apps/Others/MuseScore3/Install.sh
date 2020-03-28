#!/usr/bin/env sh

VERSION="3.4.2"
DESTROOT=$HOME/Applications
DESTDIR=$DESTROOT/MuseScore3
LAUNCHDIR=$HOME/.local/share/applications

if [ ! -d $DESTDIR ]
then
  mkdir -p $DESTDIR
fi

# Get the image.
echo "Downloading the app image..."
if [ ! -e "/tmp/MuseScore3.AppImage" ]
then
  curl -Rk "https://cdn.jsdelivr.net/musescore/v$VERSION/MuseScore-$VERSION""-x86_64.AppImage" -o /tmp/MuseScore3.AppImage
fi
echo "Installing the image..."
if [ ! -d "$DESTDIR" ]
then
  mkdir -p $DESTDIR
fi
cp -f /tmp/MuseScore3.AppImage $DESTDIR/
chmod ug+rx /$DESTDIR/MuseScore3.AppImage

# Get the icon.
echo "Downloading the icon..."
curl -Rk "https://s3.amazonaws.com/s.musescore.org/about/images/musescore-icon-round-2048.png" -o /tmp/MuseScore3.png
cp /tmp/MuseScore3.png $DESTDIR/

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
Name=MuseScore 3
Comment=WYSIWYG sheet music editor
Exec=$DESTDIR/MuseScore3.AppImage
Icon=$DESTDIR/MuseScore3.png
StartupNotify=true
Terminal=false
Type=Application
Categories=AudioVideo;
" > $LAUNCHDIR/MuseScore3.desktop
chmod ug+rx $LAUNCHDIR/MuseScore3.desktop

