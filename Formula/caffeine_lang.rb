class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "5.1.0"

  # Platform-specific downloads — binaries hosted on the caffeine repo
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v5.1.0/caffeine-5.1.0-macos-x64.tar.gz"
    sha256 "d5b7b35f2e81ab4da5eb8843004fe84f63de1a6bf021bfc1ce06d2a8d1a1f2b0"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v5.1.0/caffeine-5.1.0-macos-arm64.tar.gz"
    sha256 "f72741a75ecc03147f3c15f8d016c3c29f4bea38c68c25be35b82f7ced652823"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v5.1.0/caffeine-5.1.0-linux-x64.tar.gz"
    sha256 "d4334f1694fd6526513f2e30868329bf84a73245978e5267ef57e8d253edd26e"
  end

  def install
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
