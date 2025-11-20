class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://github.com/Brickell-Research/caffeine_lang"
  version "0.1.5"
  license "GPL-3.0-only"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v0.1.5/caffeine-0.1.5-macos-x64.tar.gz"
    sha256 "b85a32ba2d747a353f0080c9560aebe2f982d080aebfd56ae42f586f22ba4903"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v0.1.5/caffeine-0.1.5-macos-arm64.tar.gz"
    sha256 "9ba8bd584e55eb97e8070e9073842107234220277f0984e0950509506c154741"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v0.1.5/caffeine-0.1.5-linux-x64.tar.gz"
    sha256 "412c6a57783824a3f236a42f6989865ce935a036d9f068a19a1aac5607e4b87e"
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
