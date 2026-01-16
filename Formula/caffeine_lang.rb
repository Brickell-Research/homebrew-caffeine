class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "2.0.5"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v2.0.5/caffeine-2.0.5-macos-x64.tar.gz"
    sha256 "0c712d701a0ae70bb4fb683a9ac3a2481cd9f5f8690470a9bcd44c734ec62a97"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v2.0.5/caffeine-2.0.5-macos-arm64.tar.gz"
    sha256 "7d6c029af13db26484828ecf7a655af5d0404b46aa6186e28443c3391257cd9e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v2.0.5/caffeine-2.0.5-linux-x64.tar.gz"
    sha256 "1ec6a69c80cc71af2578c2e59971483725744925f221696545f0a8dc236a0467"
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
