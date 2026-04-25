class Cvm < Formula
  desc "Caffeine Version Manager"
  homepage "https://github.com/Brickell-Research/caffeine_vm"
  license "MIT"
  version "1.1.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_vm/releases/download/v1.1.0/cvm-1.1.0-macos-x64.tar.gz"
    sha256 "08be6f49b148ac116485db6e5945594eb801c615c49fc0376ecfee3ae5e5b5d4"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_vm/releases/download/v1.1.0/cvm-1.1.0-macos-arm64.tar.gz"
    sha256 "4b97c5474613c4da3d83d4c167c659662eba9ad1b0ddd9d35aa086e108fb0c9b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_vm/releases/download/v1.1.0/cvm-1.1.0-linux-x64.tar.gz"
    sha256 "323b055aeab7e1f373535e9d58866cb39cab58654dc61cab3ffce37858fc0258"
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
