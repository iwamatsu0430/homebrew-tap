cask "sockdock" do
  version "0.1.0"
  sha256 "b5d17dc5acd9f909eef29154bf1c4601d955f32a5e4d5731e238ddd593ba86d7"

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
