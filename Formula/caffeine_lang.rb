class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "3.0.4"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.4/caffeine-3.0.4-macos-x64.tar.gz"
    sha256 "b2599df7e5441fb3bf60d9eb58961b0672b4bcbf0a5d7af669c7a89b97c9cf90"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.4/caffeine-3.0.4-macos-arm64.tar.gz"
    sha256 "edc3333bf29230da70edd52b425f75d92db3848388b0925527e2620cc13e0a13"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.4/caffeine-3.0.4-linux-x64.tar.gz"
    sha256 "7ac5b815d9183402d49d3954881f634dbde409bcdc855af574b13471bf759b1c"
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
