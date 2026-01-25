class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "3.0.14"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.14/caffeine-3.0.14-macos-x64.tar.gz"
    sha256 "6d9e8f90104fe30a8b1518691b3e42b53157180404045cc2434012295c5ee594"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.14/caffeine-3.0.14-macos-arm64.tar.gz"
    sha256 "fdd02532f967123aa82ea5dde5b934864632f8814af282909cdf532ce1d42cd1"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.14/caffeine-3.0.14-linux-x64.tar.gz"
    sha256 "f15a326dc5e983b9ff46b8b145f7da87774ce15c4b19933f0efa31f8fb0030bb"
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
