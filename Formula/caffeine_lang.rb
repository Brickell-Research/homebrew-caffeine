class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "4.1.1"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.1.1/caffeine-4.1.1-macos-x64.tar.gz"
    sha256 "46708b23af57f408d43cdbcb65ef808e5ddcc529a79a1a62388ed7a947b3c852"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.1.1/caffeine-4.1.1-macos-arm64.tar.gz"
    sha256 "f9302d3d7929e190e69541af883323c627a9f1fa3e5d013ac9af9a3d8c89d08d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.1.1/caffeine-4.1.1-linux-x64.tar.gz"
    sha256 "af4125779638fc09b18a83ced7f95e019471c04a63589facad7a53ee5a3dacdb"
  end

  def install
    # The binary name includes version and platform, rename to just "caffeine"
    if OS.mac? && Hardware::CPU.intel?
      bin.install "caffeine-#{version}-macos-x64" => "caffeine"
    elsif OS.mac? && Hardware::CPU.arm?
      bin.install "caffeine-#{version}-macos-arm64" => "caffeine"
    elsif OS.linux? && Hardware::CPU.intel?
      bin.install "caffeine-#{version}-linux-x64" => "caffeine"
    end
  end

  test do
    system "#{bin}/caffeine"
  end
end
