class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "5.0.1"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v5.0.1/caffeine-5.0.1-macos-x64.tar.gz"
    sha256 "997cd587519d0de4779181d2d8089e04d9be00bdb1f9ec1d8a3a56debbe4ec17"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v5.0.1/caffeine-5.0.1-macos-arm64.tar.gz"
    sha256 "690231bb17585e87d9ac8f68c9f760c82eb66ac8ac846467c9209e439f2122e6"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v5.0.1/caffeine-5.0.1-linux-x64.tar.gz"
    sha256 "19f02cd8a110a812253e7b040fbc0f05282b97112a6f0de690d2fa92e3cf1cc6"
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
