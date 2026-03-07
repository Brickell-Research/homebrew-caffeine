class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "4.6.6"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.6.6/caffeine-4.6.6-macos-x64.tar.gz"
    sha256 "e473662bd3321474becfd0e412071e3e14a643e6591bb64c85f7b0192a154656"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.6.6/caffeine-4.6.6-macos-arm64.tar.gz"
    sha256 "0dfb2eceab7b95ee54d63efcc7009c1777111ddd2cb9c4b9cd62ffc1d1ddc211"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.6.6/caffeine-4.6.6-linux-x64.tar.gz"
    sha256 "c5f71a94bdd56e3c1e90e919eaab007998ed9f01a9eac163d0c1558a43d5c62c"
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
