#!/usr/bin/env bash
set -euo pipefail

VERSION="${VERSION:-${1:-0.7.5-arm64.2}}"
REPO="${REPO:-${2:-mujuni88/vial-gui}}"
ASSET="${ASSET:-${3:-Vial-0.7.5-arm64.dmg}}"
URL="https://github.com/${REPO}/releases/download/v${VERSION}/${ASSET}"
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TMP_DIR="$(mktemp -d)"

cleanup() {
  rm -rf "$TMP_DIR"
}
trap cleanup EXIT

cd "$ROOT"
mkdir -p Casks

curl --fail --location --show-error --silent "$URL" -o "${TMP_DIR}/${ASSET}"
SHA256="$(shasum -a 256 "${TMP_DIR}/${ASSET}" | awk '{print $1}')"

cat > Casks/vial-apple-silicon.rb <<RUBY
cask "vial-apple-silicon" do
  version "${VERSION}"
  sha256 "${SHA256}"

  url "${URL}",
      verified: "github.com/mujuni88/vial-gui/"
  name "Vial Apple Silicon"
  desc "Native Apple Silicon build of the Vial keyboard configurator"
  homepage "https://github.com/${REPO}"

  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64

  conflicts_with cask: "vial"

  app "Vial.app"

  caveats <<~EOS
    This is a personal native Apple Silicon build of Vial.
    If macOS blocks first launch, run:
      xattr -dr com.apple.quarantine ~/Applications/Vial.app
  EOS
end
RUBY

ruby -c Casks/vial-apple-silicon.rb
echo "Wrote Casks/vial-apple-silicon.rb"
echo "sha256=${SHA256}"
