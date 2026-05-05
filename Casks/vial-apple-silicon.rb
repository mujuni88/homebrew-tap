cask "vial-apple-silicon" do
  version "0.7.5-arm64.2"
  sha256 "5bcf280a5c3bb7e67d51657ea8a4de1da49a0b7a709c3d799b345929e2432922"

  url "https://github.com/mujuni88/vial-gui/releases/download/v0.7.5-arm64.2/Vial-0.7.5-arm64.dmg",
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
