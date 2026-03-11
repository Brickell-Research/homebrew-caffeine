class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "4.8.0"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.8.0/caffeine-4.8.0-macos-x64.tar.gz"
    sha256 "d8c9370251eefdfbed0da927d591ed88600252d3395b7d50ed29df3b99a32fcd"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.8.0/caffeine-4.8.0-macos-arm64.tar.gz"
    sha256 "9c2d636979a9d10f60b3fd6b4daa946b48fbd7863353a99e200527cd05174774"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.8.0/caffeine-4.8.0-linux-x64.tar.gz"
    sha256 "015d02597e4738bdd416c48f13ea494a5eed61b84198d75a047033c757eedd44"
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
