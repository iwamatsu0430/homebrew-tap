cask "sockdock" do
  version "0.2.1"
  sha256 "10c6553a821a61229c28b9f09aaaa79e28528d193dbe8f1e0789c09127f919b2"

  url "https://github.com/iwamatsu0430/sock-dock-slack/releases/download/v#{version}/SockDock-#{version}.zip"
  name "SockDock"
  desc "Menu bar app that runs Slack apps locally over Socket Mode"
  homepage "https://github.com/iwamatsu0430/sock-dock-slack"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  # No `binary` for the bundled CLI: it is quarantined like the app, so the
  # shell would be blocked by Gatekeeper. The CLI comes from the formula.
  app "SockDock.app"

  uninstall quit: "io.github.iwamatsu0430.sockdock"

  # The Slack tokens stay in the Keychain (service "sockdock"); remove them with
  # `sockdock auth delete` or Settings → Reset SockDock… before zapping.
  zap trash: [
    "~/Library/Application Support/sockdock",
    "~/Library/Logs/sockdock",
  ]

  caveats <<~EOS
    SockDock.app is not notarized by Apple. The first time you open it, macOS
    blocks it: open System Settings → Privacy & Security and click "Open Anyway".
  EOS
end
