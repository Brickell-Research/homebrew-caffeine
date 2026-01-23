class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "3.0.11"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.11/caffeine-3.0.11-macos-x64.tar.gz"
    sha256 "a3d8c3d5315c78d41127d063a44a21cb3d48e0252a13fcbe717a1018653d96bc"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.11/caffeine-3.0.11-macos-arm64.tar.gz"
    sha256 "81ef91f513deba4554b59626006f6081d81baed3aa984ac5c4e2da8102fddad7"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.11/caffeine-3.0.11-linux-x64.tar.gz"
    sha256 "923ce68e5bd72015f5cc8f7fb24d10ed538960755bd123226751939fed9e4bdc"
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
