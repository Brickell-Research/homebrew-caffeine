class Cvm < Formula
  desc "Caffeine Version Manager"
  homepage "https://github.com/Brickell-Research/caffeine_vm"
  license "MIT"
  version "1.0.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_vm/releases/download/v1.0.2/cvm-1.0.2-macos-x64.tar.gz"
    sha256 "8f1dcdf72ac45035e13b7fce497b190be75bf09ac8c58d60252274c66bca28b0"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_vm/releases/download/v1.0.2/cvm-1.0.2-macos-arm64.tar.gz"
    sha256 "3d1ca5ba42b392c62b46eec67147359f35c9cbc4620bc01c5bcf83d15697473a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_vm/releases/download/v1.0.2/cvm-1.0.2-linux-x64.tar.gz"
    sha256 "8d08be5e287245ca591a226196ed16cc4c7787010b0c4a5ac0112a3bbc449d66"
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
