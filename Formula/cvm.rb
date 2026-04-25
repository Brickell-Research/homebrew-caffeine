class Cvm < Formula
  desc "Caffeine Version Manager"
  homepage "https://github.com/Brickell-Research/caffeine_vm"
  license "MIT"
  version "1.2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_vm/releases/download/v1.2.0/cvm-1.2.0-macos-x64.tar.gz"
    sha256 "76118bbf399b4f7ca6b0a3e76b142ffb28b7e73798424c946b2fe14991106902"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_vm/releases/download/v1.2.0/cvm-1.2.0-macos-arm64.tar.gz"
    sha256 "cb07785cb38093a29e66aa365863a93281f4e594deb2e89d4b8c14a0fd10a799"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_vm/releases/download/v1.2.0/cvm-1.2.0-linux-x64.tar.gz"
    sha256 "f50877366ffb107869074a439d1ec3633989883f86b3b962eecaae27cbd33870"
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
