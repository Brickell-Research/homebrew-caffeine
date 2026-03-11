class Cvm < Formula
  desc "Caffeine Version Manager"
  homepage "https://github.com/Brickell-Research/caffeine_vm"
  license "MIT"
  version "1.0.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_vm/releases/download/v1.0.4/cvm-1.0.4-macos-x64.tar.gz"
    sha256 "d056542fece3367de866bc8e124c90b3dbfc9b4e36eb0d7be1adb7fb8bed3e4d"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_vm/releases/download/v1.0.4/cvm-1.0.4-macos-arm64.tar.gz"
    sha256 "3af6846d485e3c92a834fca9753536e81983c9fe51a9b8b3a35914ecd5937977"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_vm/releases/download/v1.0.4/cvm-1.0.4-linux-x64.tar.gz"
    sha256 "06ead206ba222a465debf3b7c4003a5eeb2b2230d41b56ccee4cbaa39c3148cb"
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
