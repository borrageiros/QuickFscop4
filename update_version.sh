#!/bin/bash

INSTALLER_NSI="installer.nsi"
F4ST_C="f4st.c"
APP_RC="include/app.rc"

get_current_version() {
  if [ -f "$INSTALLER_NSI" ]; then
    grep -oP '!define APP_VERSION\s+"\K[^"]+' "$INSTALLER_NSI" 2>/dev/null | head -1
  elif [ -f "$F4ST_C" ]; then
    grep -oP '#define APP_VERSION\s+"\K[^"]+' "$F4ST_C" 2>/dev/null | head -1
  fi
}

CURRENT_VERSION=$(get_current_version)

if [ -z "$CURRENT_VERSION" ]; then
  echo "Error: Could not determine current version from project files."
  exit 1
fi

echo "Current version: $CURRENT_VERSION"
echo ""
read -p "What version do you want to change to? " NEW_VERSION

if [ -z "$NEW_VERSION" ]; then
  echo "Error: No version provided. Aborting."
  exit 1
fi

if ! echo "$NEW_VERSION" | grep -qE '^[0-9]+\.[0-9]+(\.[0-9]+)?$'; then
  echo "Error: Invalid version format. Use format X.Y or X.Y.Z"
  echo "Example: 1.5 or 2.0.0"
  exit 1
fi

VERSION_MAJOR=$(echo "$NEW_VERSION" | cut -d. -f1)
VERSION_MINOR=$(echo "$NEW_VERSION" | cut -d. -f2)
VERSION_BUILD=$(echo "$NEW_VERSION" | cut -d. -f3)
if [ -z "$VERSION_BUILD" ]; then
  VERSION_BUILD="0"
fi

if [ ! -f "$INSTALLER_NSI" ]; then
  echo "Error: $INSTALLER_NSI not found"
  exit 1
fi

if [ ! -f "$F4ST_C" ]; then
  echo "Error: $F4ST_C not found"
  exit 1
fi

if [ ! -f "$APP_RC" ]; then
  echo "Error: $APP_RC not found"
  exit 1
fi

echo ""
echo "Updating version from $CURRENT_VERSION to $NEW_VERSION..."
echo ""

sed -i "s/!define APP_VERSION[[:space:]]*\"[^\"]*\"/!define APP_VERSION   \"$NEW_VERSION\"/" "$INSTALLER_NSI"
echo "✓ Updated $INSTALLER_NSI"

sed -i "s/#define APP_VERSION[[:space:]]*\"[^\"]*\"/#define APP_VERSION         \"$NEW_VERSION\"/" "$F4ST_C"
echo "✓ Updated $F4ST_C"

sed -i "s/FILEVERSION[[:space:]]*[0-9]*,[0-9]*,[0-9]*,[0-9]*/FILEVERSION $VERSION_MAJOR,$VERSION_MINOR,$VERSION_BUILD,0/" "$APP_RC"
sed -i "s/PRODUCTVERSION[[:space:]]*[0-9]*,[0-9]*,[0-9]*,[0-9]*/PRODUCTVERSION $VERSION_MAJOR,$VERSION_MINOR,$VERSION_BUILD,0/" "$APP_RC"
sed -i "s/VALUE \"FileVersion\", \"[^\"]*\"/VALUE \"FileVersion\", \"$NEW_VERSION\"/" "$APP_RC"
echo "✓ Updated $APP_RC"

echo ""
echo "Version updated successfully from $CURRENT_VERSION to $NEW_VERSION!"
echo ""
echo "Files modified:"
echo "  - $INSTALLER_NSI"
echo "  - $F4ST_C"
echo "  - $APP_RC"
