class Cvm < Formula
  desc "Caffeine Version Manager"
  homepage "https://github.com/Brickell-Research/caffeine_vm"
  license "MIT"
  version "1.1.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_vm/releases/download/v1.1.1/cvm-1.1.1-macos-x64.tar.gz"
    sha256 "ab8d002412d522239b02d899a36404087b032ebd10b036e3e19e3ad23f4cfa79"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_vm/releases/download/v1.1.1/cvm-1.1.1-macos-arm64.tar.gz"
    sha256 "ba4d2b09e8e0b81da34d091537ccc976634baf28b12724ed94aadd9893d26a3e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_vm/releases/download/v1.1.1/cvm-1.1.1-linux-x64.tar.gz"
    sha256 "c3600ca76b082bea327546d63b58b5d11035716332bc6b6755a01881a565f02c"
  end

  def install
    bin.install Dir["cvm-*"].first => "cvm"
  end

  def caveats
    <<~EOS
      To use caffeine versions managed by cvm, add this to your shell config:

export PATH="$HOME/.cvm/current:$PATH"

      Then run: cvm install latest
    EOS
  end

  test do
    assert_match "Caffeine Version Manager", shell_output("#{bin}/cvm help")
  end
end
