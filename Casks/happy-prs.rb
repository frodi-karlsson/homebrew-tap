cask "happy-prs" do
  version "0.1.1"
  sha256 "38266ac4c36200668f376645b83fc10463cbc42cf8be606dd077f12cb7bc1e8c"

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

  zap trash: [
    "~/Library/Preferences/com.frodikarlsson.happyprs.plist",
    "~/Library/LaunchAgents/com.frodikarlsson.happyprs.plist",
  ]
end
