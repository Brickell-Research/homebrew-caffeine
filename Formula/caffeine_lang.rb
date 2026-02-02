class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "4.0.5"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.0.5/caffeine-4.0.5-macos-x64.tar.gz"
    sha256 "4ea7d1cbb5dffd63aadd4ccf6d3b01cee06c81fb73b4c10e1a9026158ea352ec"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.0.5/caffeine-4.0.5-macos-arm64.tar.gz"
    sha256 "e7dcc678e6c868984b6211153c59885ac6280e01e4e54695760e3bb49db2605f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.0.5/caffeine-4.0.5-linux-x64.tar.gz"
    sha256 "dcbb6971f64176e627a1a8299ac094ca8111674291c21c65b40e498d8b08cb7a"
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
