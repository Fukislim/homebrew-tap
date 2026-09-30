cask "stillhands" do
  version "0.2.0"
  sha256 "f71bf1f945b4edb7ab02ec385ccbc773eb5c0ae309add08f0ce4f02dc44d0c0e"

  url "https://github.com/fukislim/stillhands/releases/download/v#{version}/Stillhands-#{version}.zip"
  name "Stillhands"
  desc "Keyboard, mouse and trackpad lock that keeps the screen on"
  homepage "https://github.com/fukislim/stillhands"

  depends_on macos: :ventura

  app "Stillhands.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Stillhands.app"],
        writable_paths: ["{{appdir}}/Stillhands.app"]
  end

  uninstall quit: "io.github.fukislim.stillhands"

  zap trash: "~/Library/Preferences/io.github.fukislim.stillhands.plist"

  caveats <<~EOS
    Stillhands needs Accessibility access to block input:
      System Settings > Privacy & Security > Accessibility
  EOS
end
