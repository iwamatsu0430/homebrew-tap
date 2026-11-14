class Sockdock < Formula
  desc "Run Slack apps locally: one Socket Mode connection, many handlers"
  homepage "https://github.com/iwamatsu0430/sock-dock-slack"
  url "https://github.com/iwamatsu0430/sock-dock-slack/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "84ce2e90d8e9db18a21e301bb3851f58374021faf139d1acb6b40cda6648351a"
  license "MIT"
  head "https://github.com/iwamatsu0430/sock-dock-slack.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=v#{version}"), "./cmd/sockdock"
    generate_completions_from_executable(bin/"sockdock", "completion")
  end

  def caveats
    <<~EOS
      To start SockDock at login (instead of `brew services`):
        sockdock service install
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sockdock --version")
    system bin/"sockdock", "init", "--config", testpath/"config.yaml"
    assert_path_exists testpath/"config.yaml"
  end
end
