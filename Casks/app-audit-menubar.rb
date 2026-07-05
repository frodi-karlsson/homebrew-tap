cask "app-audit-menubar" do
  version "0.1.0"
  sha256 "fd7af0c283be1bf7c548049458bb752955a31da7eb3d3dc07290165a858b7e08"
  url "https://github.com/frodi-karlsson/agentic-app-audit/releases/download/app-v0.1.0/AppAudit.zip"
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
