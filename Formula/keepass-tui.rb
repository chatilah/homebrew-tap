# typed: strict
# frozen_string_literal: true

# A terminal interface for browsing KeePass databases.
class KeepassTui < Formula
  desc "Terminal interface for KeePass databases"
  homepage "https://github.com/chatilah/keepass-tui"
  version "0.1.3"
  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/chatilah/keepass-tui/releases/download/v#{version}/keepass-tui-macos-arm64.tar.gz"
    sha256 "2897a9838a618f0ea49f40d7b43f991b8780c7b3e680ed93180cd3a9d6014c41"
  else
    url "https://github.com/chatilah/keepass-tui/releases/download/v#{version}/keepass-tui-macos-x86_64.tar.gz"
    sha256 "bddb875351c5c1adf4f5c4b60faa0bbbcc2d0eedcf82e8d02167c15b338356d3"
  end

  def install
    bin.install "keepass-tui"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/keepass-tui --help")
  end
end
