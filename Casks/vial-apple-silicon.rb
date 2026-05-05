cask "vial-apple-silicon" do
  version "0.7.5-arm64.1"
  sha256 "db15b5b19416e998c7ff992e44c965395cf3714cc8bf8a01a0061e43ba2a5048"

  url "https://github.com/mujuni88/vial-gui/releases/download/v0.7.5-arm64.1/Vial-0.7.5-arm64.dmg",
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
