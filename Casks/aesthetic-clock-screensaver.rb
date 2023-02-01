cask "aesthetic-clock-screensaver" do
  version "1.0.0-alpha.1"
  sha256 "a40621524f88834f55222e2126d9fc75c7d4401a0d6bc0c124815041cae6dc68"

  url "https://github.com/jonnyjohannes/AestheticClock/archive/refs/tags/v#{version}.tar.gz"
  name "AestheticClock"
  desc "Aesthetic Clock Screensaver"
  homepage "https://github.com/jonnyjohannes/AestheticClock"

  screen_saver "AestheticClock-#{version}/AestheticClock.saver"

  preflight do
    system_command "rm", args: ["-rf", "#{config.screen_saverdir}/AestheticClock.saver"]
  end

  postflight do
    if MacOS.version >= :big_sur
      system_command "xattr",
                     args: ["-d", "com.apple.quarantine", "#{config.screen_saverdir}/AestheticClock.saver"]
    end
  end

  caveats <<~EOS
    NOTE: Enable the screensaver named "AestheticClock" in "Desktop & Screen saver".
    `open /System/Library/PreferencePanes/DesktopScreenEffectsPref.prefPane`
  EOS
end
