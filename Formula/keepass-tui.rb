# typed: strict
# frozen_string_literal: true

# A terminal interface for browsing KeePass databases.
class KeepassTui < Formula
  desc "Terminal interface for KeePass databases"
  homepage "https://github.com/chatilah/keepass-tui"
  version "0.1.2"
  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/chatilah/keepass-tui/releases/download/v#{version}/keepass-tui-macos-arm64.tar.gz"
    sha256 "14571264da5387a1a13a81c5f4983b88aeb797b1170418e581135b0e14a1445b"
  else
    url "https://github.com/chatilah/keepass-tui/releases/download/v#{version}/keepass-tui-macos-x86_64.tar.gz"
    sha256 "f776da125e3dee3b6711b02ec12c7165cf88473b5512702ea5ee4a678c4f1cb5"
  end

  def install
    bin.install "keepass-tui"
  end

  test do
    assert_match "usage:", shell_output("#{bin}/keepass-tui --help")
  end
end
