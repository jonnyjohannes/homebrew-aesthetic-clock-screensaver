cask "aesthetic-clock-screensaver" do
  version "1.0.0-alpha.1"
  sha256 "a40621524f88834f55222e2126d9fc75c7d4401a0d6bc0c124815041cae6dc68"

  url "https://github.com/jonnyjohannes/AestheticClock/archive/refs/tags/v#{version}.tar.gz"
  name "AestheticClock"
  desc "Aesthetic Clock Screensaver"
  homepage "https://github.com/jonnyjohannes/AestheticClock"

  stage_only true

  caveats <<~EOS
    The screensaver file is staged here:
    `open "#{staged_path}/AestheticClock-#{version}/AestheticClock.saver"`

    After opening it, enable "AestheticClock" in "Desktop & Screen saver".
    `open /System/Library/PreferencePanes/DesktopScreenEffectsPref.prefPane`
  EOS
end
