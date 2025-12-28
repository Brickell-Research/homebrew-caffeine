class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "2.0.3"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v2.0.3/caffeine-2.0.3-macos-x64.tar.gz"
    sha256 "24dd8c80f4bf314a1c7ef90612b09f60d83ee4e298cfc302b8c5a64fc7ae4604"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v2.0.3/caffeine-2.0.3-macos-arm64.tar.gz"
    sha256 "8fa2ef244a1e24e742dd22bc941bef79c437bffbfc713113040c489592ae247c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v2.0.3/caffeine-2.0.3-linux-x64.tar.gz"
    sha256 "5f7469de9a28aa6c97075d0727e1367b2b6e3426195c333ad153cf9dab17d19b"
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
