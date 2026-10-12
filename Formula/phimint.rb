# Homebrew formula for phimint.
#
#   brew install hibuka-labs/phimint/phimint
#
# Source of truth: hibuka-labs/phimint (Formula/phimint.rb). Synced to the tap
# repository hibuka-labs/homebrew-phimint by deploy/release.sh at every release.
# The version, URLs and sha256 values below are rewritten at release — do not
# hand-edit them.
class Phimint < Formula
  desc "Terminal AI coding agent built on phi-agent"
  homepage "https://github.com/hibuka-labs/phimint"
  version "0.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hibuka-labs/phimint/releases/download/v0.4.1/phimint-0.4.1-darwin-aarch64.tar.gz"
      mirror "https://gitee.com/chenkangzeng_admin/phimint/releases/download/v0.4.1/phimint-0.4.1-darwin-aarch64.tar.gz"
      sha256 "4cf699a5b7f70ec97cd835a88db181b60bf58886bdc84a3d895964eecec93e21"
    end
    on_intel do
      url "https://github.com/hibuka-labs/phimint/releases/download/v0.4.1/phimint-0.4.1-darwin-x86_64.tar.gz"
      mirror "https://gitee.com/chenkangzeng_admin/phimint/releases/download/v0.4.1/phimint-0.4.1-darwin-x86_64.tar.gz"
      sha256 "651f904f24b71b0103e6d2ac5b175ef2bc1c78c39b2191d397867ca3091601f6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hibuka-labs/phimint/releases/download/v0.4.1/phimint-0.4.1-linux-aarch64.tar.gz"
      mirror "https://gitee.com/chenkangzeng_admin/phimint/releases/download/v0.4.1/phimint-0.4.1-linux-aarch64.tar.gz"
      sha256 "7134767ae47f8a7f3b333e7c4dde264fd1ab2686749074291b6e78b4550dc2ab"
    end
    on_intel do
      url "https://github.com/hibuka-labs/phimint/releases/download/v0.4.1/phimint-0.4.1-linux-x86_64.tar.gz"
      mirror "https://gitee.com/chenkangzeng_admin/phimint/releases/download/v0.4.1/phimint-0.4.1-linux-x86_64.tar.gz"
      sha256 "ad4e7653ac0ad4e7b340f33e420c1ab54239546c40b6fceb11577e5dc9e4c483"
    end
  end

  def install
    bin.install "phimint"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/phimint --version")
  end
end
