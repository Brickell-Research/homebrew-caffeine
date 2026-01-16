class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "2.0.5"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v2.0.5/caffeine-2.0.5-macos-x64.tar.gz"
    sha256 "3dac1e4f3243efe4ea613fbaf3959f6e4ed8b8cdae7364961bec0a8fbf2ae46a"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v2.0.5/caffeine-2.0.5-macos-arm64.tar.gz"
    sha256 "6ea3caedf673284989a8bf5a7f307a232ef24eea4e0bebcc6540ba54ea6c0a5f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v2.0.5/caffeine-2.0.5-linux-x64.tar.gz"
    sha256 "6d3340c0bf48038b9ba4cbee8c9e3ee0cfcb192764a12a655979f11a31cd0d80"
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
