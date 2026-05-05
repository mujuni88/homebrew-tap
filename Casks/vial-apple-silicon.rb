cask "vial-apple-silicon" do
  version "0.7.5-arm64.3"
  sha256 "18c804dd57d6705b20f1482f67f97f636f9ecb78c5d9fb859661929db7dd968e"

  url "https://github.com/mujuni88/vial-gui/releases/download/v0.7.5-arm64.3/Vial-0.7.5-arm64.dmg",
      verified: "github.com/mujuni88/vial-gui/"
  name "Vial Apple Silicon"
  desc "Native Apple Silicon build of the Vial keyboard configurator"
  homepage "https://github.com/mujuni88/vial-gui"

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
