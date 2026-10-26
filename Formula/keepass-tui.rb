# typed: strict
# frozen_string_literal: true

# A terminal interface for browsing KeePass databases.
class KeepassTui < Formula
  desc "Terminal interface for KeePass databases"
  homepage "https://github.com/chatilah/keepass-tui"
  version "0.1.4"
  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/chatilah/keepass-tui/releases/download/v#{version}/keepass-tui-macos-arm64.tar.gz"
    sha256 "7afad738ec45b8cc84b7f62d12d8aec00d55b18918047a700528db4243e1e8aa"
  else
    url "https://github.com/chatilah/keepass-tui/releases/download/v#{version}/keepass-tui-macos-x86_64.tar.gz"
    sha256 "6faa0921132cfe2cac0e750ff74fe8ac505f13b433d30a04b0f6c5c282fac6d9"
  end

  def install
    bin.install "keepass-tui"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/keepass-tui --help")
  end
end
