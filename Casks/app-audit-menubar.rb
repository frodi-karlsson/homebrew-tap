cask "app-audit-menubar" do
  version "0.1.1"
  sha256 "9225eafcde73ce9c177a90f039d7cc4c56c3db76988bb33c36517e15298ac953"
  url "https://github.com/frodi-karlsson/agentic-app-audit/releases/download/app-v0.1.1/AppAudit.zip"
  name "App Audit"
  desc "Menu-bar app for staleness and CVE audits"
  homepage "https://github.com/frodi-karlsson/agentic-app-audit"
  depends_on cask: "app-audit"
  app "App Audit.app"
  postflight do
    system_command "/usr/bin/xattr",
      args: ["-dr", "com.apple.quarantine", "#{appdir}/App Audit.app"]
  end
end
