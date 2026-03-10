class Cvm < Formula
  desc "Caffeine Version Manager"
  homepage "https://github.com/Brickell-Research/caffeine_vm"
  license "MIT"
  version "1.0.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_vm/releases/download/v1.0.3/cvm-1.0.3-macos-x64.tar.gz"
    sha256 "77f33ffa9c7738fb2ad48ac4c0201867245222f25c9cd8bde42f229180ccc917"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_vm/releases/download/v1.0.3/cvm-1.0.3-macos-arm64.tar.gz"
    sha256 "906b223568aad45782d25bca1bd33721dc3a0ee130c420dbf21cd6fcfe116285"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_vm/releases/download/v1.0.3/cvm-1.0.3-linux-x64.tar.gz"
    sha256 "93a164819dd2b0ba3ad1be08bf3619973b529fa6d27f2387fbd7163015dca679"
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
