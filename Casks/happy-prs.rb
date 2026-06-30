cask "happy-prs" do
  version "0.1.2"
  sha256 "5c82d40b4a53b43679903c8198e7b8c275619c117f70aae6dd5d62b977c39f08"

  url "https://github.com/frodi-karlsson/happy-prs/releases/download/v#{version}/happy-prs-#{version}.tar.gz"
  name "Happy PRs"
  desc "Menubar app surfacing GitHub PRs that need your input"
  homepage "https://github.com/frodi-karlsson/happy-prs"

  depends_on macos: :sonoma
  # The app shells out to `gh auth token` to talk to GitHub. Brew will
  # install gh first if it isn't already present. The user still has
  # to run `gh auth login` once — the app prompts with that exact
  # string in the menubar footer if it isn't authenticated.
  depends_on formula: "gh"

  app "Happy PRs.app"

  # The .app is only ad-hoc signed (no Apple Developer ID), so the
  # quarantine attribute that brew applies to network-downloaded
  # artifacts would otherwise trigger a Gatekeeper "could not verify"
  # block on first launch. Strip it so the app opens normally.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-rds", "com.apple.quarantine", "#{appdir}/Happy PRs.app"]
  end

  zap trash: [
    "~/Library/Preferences/com.frodikarlsson.happyprs.plist",
    "~/Library/LaunchAgents/com.frodikarlsson.happyprs.plist",
  ]
end
