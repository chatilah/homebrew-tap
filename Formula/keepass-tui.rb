# typed: strict
# frozen_string_literal: true

# A terminal interface for browsing KeePass databases.
class KeepassTui < Formula
  desc "Terminal interface for KeePass databases"
  homepage "https://github.com/chatilah/keepass-tui"
  version "0.1.0"
  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/chatilah/keepass-tui/releases/download/v#{version}/keepass-tui-macos-arm64.tar.gz"
    sha256 "7abe85229809cf0a211426e2069770e0fdde47c14784d58428f6cae120e63471"
  else
    url "https://github.com/chatilah/keepass-tui/releases/download/v#{version}/keepass-tui-macos-x86_64.tar.gz"
    sha256 "f72636c6a97fcc9f3b994edf231f91452d4fd3726d240834253398fdce08cb32"
  end

  def install
    bin.install "keepass-tui"
  end

  test do
    assert_match "usage:", shell_output("#{bin}/keepass-tui --help")
  end
end
