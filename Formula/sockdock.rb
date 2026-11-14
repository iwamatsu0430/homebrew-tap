class Sockdock < Formula
  desc "Run Slack apps locally: one Socket Mode connection, many handlers"
  homepage "https://github.com/iwamatsu0430/sock-dock-slack"
  url "https://github.com/iwamatsu0430/sock-dock-slack/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "7988e0e025ecd50b6ed06b9a5073208587d4b6447cd4594fdcf1b0cfe1f3b5f6"
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
