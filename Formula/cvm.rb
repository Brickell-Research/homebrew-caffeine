class Cvm < Formula
  desc "Caffeine Version Manager"
  homepage "https://github.com/Brickell-Research/caffeine_vm"
  license "MIT"
  version "1.0.6"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_vm/releases/download/v1.0.6/cvm-1.0.6-macos-x64.tar.gz"
    sha256 "9f8ce4b77e842fd7499721795dc361885a6c81bab063f1ea22740940c1519335"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_vm/releases/download/v1.0.6/cvm-1.0.6-macos-arm64.tar.gz"
    sha256 "8b0302d7d4e2dcff0774428fa61086f5cae04fdb201821d6dc7e9df99eb8a913"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_vm/releases/download/v1.0.6/cvm-1.0.6-linux-x64.tar.gz"
    sha256 "28f1848beeb4457818f598f967ca24d9e07fb339b3e26fbbff2975bcf6d11101"
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
