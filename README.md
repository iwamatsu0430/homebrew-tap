# iwamatsu0430/homebrew-tap

Homebrew tap for tools by [@iwamatsu0430](https://github.com/iwamatsu0430).

## Usage

```sh
brew tap iwamatsu0430/tap
```

Or install a package directly without tapping first:

```sh
brew install iwamatsu0430/tap/<formula>
brew install --cask iwamatsu0430/tap/<cask>
```

## Packages

| Name | Type | Install | Description |
| --- | --- | --- | --- |
| [sockdock](https://github.com/iwamatsu0430/sock-dock-slack) | Formula | `brew install iwamatsu0430/tap/sockdock` | CLI to run Slack apps locally over one Socket Mode connection |
| [sockdock](https://github.com/iwamatsu0430/sock-dock-slack) | Cask | `brew install --cask iwamatsu0430/tap/sockdock` | Menu bar app for SockDock |

### Notes

#### sockdock

- The formula and the cask can be installed side by side. The cask does not put the CLI on your `PATH`; install the formula for that.
- SockDock.app is ad-hoc signed and not notarized by Apple, so macOS blocks it the first time you open it. Open **System Settings → Privacy & Security** and click **Open Anyway**.

## Layout

- `Formula/` — formulae
- `Casks/` — casks

Formulae and casks are usually updated by each project's release workflow. Please report issues to the project's own repository.

## License

[MIT](LICENSE)
