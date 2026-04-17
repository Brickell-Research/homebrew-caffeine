class Cvm < Formula
  desc "Caffeine Version Manager"
  homepage "https://github.com/Brickell-Research/caffeine_vm"
  license "MIT"
  version "1.0.5"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_vm/releases/download/v1.0.5/cvm-1.0.5-macos-x64.tar.gz"
    sha256 "b818493398ac292ca342ec671c7907b92e11eada2cb35e456bab5417a3412190"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_vm/releases/download/v1.0.5/cvm-1.0.5-macos-arm64.tar.gz"
    sha256 "221a00ea409fb306f84940900c1a3b078cfcdeb7437fe77e41ca74b0cdcaae70"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_vm/releases/download/v1.0.5/cvm-1.0.5-linux-x64.tar.gz"
    sha256 "39b92c9af1ef1eb51f2ce355187b1cd388610c51d7228c60ee84abdf25a24418"
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
