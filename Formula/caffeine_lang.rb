class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "4.5.0"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.5.0/caffeine-4.5.0-macos-x64.tar.gz"
    sha256 "83455da959762533b8867956db5a41894c062088f4e93632e6fd4cb4e8d91df0"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.5.0/caffeine-4.5.0-macos-arm64.tar.gz"
    sha256 "f24f2bf4828281a4990dc8de531fd09571ad0523fb02e4eb73759c422148471a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.5.0/caffeine-4.5.0-linux-x64.tar.gz"
    sha256 "666ba9c551ef9fb3e6135a94f3a1badcfb001b9a2521dbfab3b46d9668774a5d"
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
