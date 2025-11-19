#!/bin/bash
# Script to update formula with new version and SHA256 hashes

VERSION=$1
if [ -z "$VERSION" ]; then
  echo "Usage: ./update_formula.sh <version>"
  echo "Example: ./update_formula.sh 0.2.0"
  exit 1
fi

echo "Updating Caffeine Lang formula to version $VERSION..."

FORMULA_FILE="Formula/caffeine_lang.rb"

# Update version in formula
sed -i.bak "s/version \".*\"/version \"$VERSION\"/" "$FORMULA_FILE"

# URLs for each platform (note: tag format is v.X.X.X)
MACOS_X64_URL="https://github.com/Brickell-Research/caffeine_lang/releases/download/v.${VERSION}/caffeine-${VERSION}-macos-x64.tar.gz"
MACOS_ARM64_URL="https://github.com/Brickell-Research/caffeine_lang/releases/download/v.${VERSION}/caffeine-${VERSION}-macos-arm64.tar.gz"
LINUX_X64_URL="https://github.com/Brickell-Research/caffeine_lang/releases/download/v.${VERSION}/caffeine-${VERSION}-linux-x64.tar.gz"

echo "Downloading and calculating SHA256 checksums..."

# Calculate SHA256 for each platform
echo "  - macOS x64..."
SHA_MACOS_X64=$(curl -sL "$MACOS_X64_URL" | shasum -a 256 | cut -d' ' -f1)

echo "  - macOS arm64..."
SHA_MACOS_ARM64=$(curl -sL "$MACOS_ARM64_URL" | shasum -a 256 | cut -d' ' -f1)

echo "  - Linux x64..."
SHA_LINUX_X64=$(curl -sL "$LINUX_X64_URL" | shasum -a 256 | cut -d' ' -f1)

echo ""
echo "SHA256 Checksums calculated:"
echo "  macOS x64:   $SHA_MACOS_X64"
echo "  macOS arm64: $SHA_MACOS_ARM64"
echo "  Linux x64:   $SHA_LINUX_X64"

# Update URLs in formula
sed -i.bak "s|caffeine_lang/releases/download/v\.[^/]*/caffeine-[^-]*-macos-x64|caffeine_lang/releases/download/v.${VERSION}/caffeine-${VERSION}-macos-x64|g" "$FORMULA_FILE"
sed -i.bak "s|caffeine_lang/releases/download/v\.[^/]*/caffeine-[^-]*-macos-arm64|caffeine_lang/releases/download/v.${VERSION}/caffeine-${VERSION}-macos-arm64|g" "$FORMULA_FILE"
sed -i.bak "s|caffeine_lang/releases/download/v\.[^/]*/caffeine-[^-]*-linux-x64|caffeine_lang/releases/download/v.${VERSION}/caffeine-${VERSION}-linux-x64|g" "$FORMULA_FILE"

echo ""
echo "Please manually update the SHA256 hashes in $FORMULA_FILE:"
echo ""
echo "For macOS x64:   sha256 \"$SHA_MACOS_X64\""
echo "For macOS arm64: sha256 \"$SHA_MACOS_ARM64\""
echo "For Linux x64:   sha256 \"$SHA_LINUX_X64\""
echo ""
echo "After updating, test with:"
echo "  brew audit --strict Formula/caffeine_lang.rb"
echo "  brew install --build-from-source Formula/caffeine_lang.rb"
echo "  brew test caffeine_lang"

# Clean up backup files
rm -f "$FORMULA_FILE.bak"
