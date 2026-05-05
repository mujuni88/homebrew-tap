# mujuni88 Homebrew Tap

Personal Homebrew tap for macOS tools that are not available in the shape I need upstream.

## Vial Apple Silicon

Install:

```bash
brew tap mujuni88/tap
brew uninstall --cask vial
brew install --cask vial-apple-silicon
```

Verify:

```bash
file ~/Applications/Vial.app/Contents/MacOS/Vial
```

Expected output includes `arm64`.
