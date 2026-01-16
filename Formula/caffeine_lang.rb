class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "3.0.0"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.0/caffeine-3.0.0-macos-x64.tar.gz"
    sha256 "12c8c5b4c5f151b6f09fbd08442293d07cdca7acfed34c600e5711b16c660847"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.0/caffeine-3.0.0-macos-arm64.tar.gz"
    sha256 "0b36b821198f89770f154dd9d83faba4197d6f86c931a065d7562cd033fbf003"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.0/caffeine-3.0.0-linux-x64.tar.gz"
    sha256 "912c4a2a768d4dcd69c12f9660e1c92d57fb8047a5ba09444085a05c6affe655"
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
