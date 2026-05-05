# mujuni88 Homebrew Tap

Personal Homebrew tap for macOS tools that are not available in the shape I need upstream.

## Vial Apple Silicon

Install:

```bash
brew tap mujuni88/tap
brew uninstall --cask vial || true
brew uninstall --cask vial-apple-silicon || true
brew install --cask vial-apple-silicon
xattr -dr com.apple.quarantine ~/Applications/Vial.app
```

Verify:

```bash
file ~/Applications/Vial.app/Contents/MacOS/Vial
```

Expected output includes `arm64`.
