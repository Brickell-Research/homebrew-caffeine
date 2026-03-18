class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "5.0.4"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v5.0.4/caffeine-5.0.4-macos-x64.tar.gz"
    sha256 "f3daefd63f9636da47e00235affc7aa784182dee01f93194639ed73358a5407f"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v5.0.4/caffeine-5.0.4-macos-arm64.tar.gz"
    sha256 "6903a188740937870c8d277a732792ef8d44c389da2ce397434eca2bee4e1661"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v5.0.4/caffeine-5.0.4-linux-x64.tar.gz"
    sha256 "726feda44109481d83302849340ca35cce44e44544115745081883eb858370ca"
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
