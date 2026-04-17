class Cvm < Formula
  desc "Caffeine Version Manager"
  homepage "https://github.com/Brickell-Research/caffeine_vm"
  license "MIT"
  version "1.0.5"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_vm/releases/download/v1.0.5/cvm-1.0.5-macos-x64.tar.gz"
    sha256 "d9b373b439c6d431b75f0fa481d3cee9959d56274fdafd8dbc55534c815b5fa1"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_vm/releases/download/v1.0.5/cvm-1.0.5-macos-arm64.tar.gz"
    sha256 "74f980b18bfdd7be0b2c93730ca7084bf07050a3d550681c900723d91de023ae"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_vm/releases/download/v1.0.5/cvm-1.0.5-linux-x64.tar.gz"
    sha256 "00f33f435298a257aa86bbb11659d7dd30e6d0e073645d1b9c22cb6a57a3e58c"
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
