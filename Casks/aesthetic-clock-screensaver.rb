cask "aesthetic-clock-screensaver" do
  version "0.0.1-alpha"
  sha256 "a0951e2ab12ed20127a83d1c03d5d911b76160bc515f9c3ba858d001f3df944d"

  url "https://github.com/jonnyjohannes/AestheticClock/archive/refs/tags/v#{version}.tar.gz"
  name "AestheticClock"
  desc "Aesthetic Clock Screensaver"
  homepage "https://github.com/jonnyjohannes/AestheticClock"
  license "mit"

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