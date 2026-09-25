cask "stillhands" do
  version "0.1.0"
  sha256 "af585ef97ec9ab4cfcf8ea8e0cb32328417360e823a0c1faa4acd51d57fbb077"

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
