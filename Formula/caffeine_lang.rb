class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "4.3.7"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.3.7/caffeine-4.3.7-macos-x64.tar.gz"
    sha256 "ca6b646a12d17566c7c8ee59e8d989d3589cf02b1022a6008560d61e4e963117"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.3.7/caffeine-4.3.7-macos-arm64.tar.gz"
    sha256 "f7952efc5270474ae9a8a8f2980dd646d3a20b323bc7db04f432cb7ae33a0bf3"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.3.7/caffeine-4.3.7-linux-x64.tar.gz"
    sha256 "ad56067153daf1d261cc350c7c75b436625856b3b2d89aa7138630f768d18cf6"
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
