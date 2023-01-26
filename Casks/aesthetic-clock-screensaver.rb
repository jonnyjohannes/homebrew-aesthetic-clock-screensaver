cask "aesthetic-clock-screensaver" do
  version "1.0.0-alpha"
  sha256 "7e8e9fd6ed033a1b5fcbb16a92bf8bb1da0b5fadc31a669c32927cb18272aeea"

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
