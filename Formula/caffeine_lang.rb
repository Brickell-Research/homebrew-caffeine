class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "0.2.19"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v0.2.19/caffeine-0.2.19-macos-x64.tar.gz"
    sha256 "a552ae6f276f77562506c63562bd40c06714a9b48bf9ba6a2b45d6df385ba8b6"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v0.2.19/caffeine-0.2.19-macos-arm64.tar.gz"
    sha256 "4c1b35112a654b459500b0ababa1cc024316077654101d2ea9dac63b46522191"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v0.2.19/caffeine-0.2.19-linux-x64.tar.gz"
    sha256 "8e8a1aa2db92a244084d5a22dabbd2edad847591cceb38af3259746debb7f718"
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
