class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "1.0.2"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v1.0.2/caffeine-1.0.2-macos-x64.tar.gz"
    sha256 "584b0077dcdf5fcfa372d6c14b680fb8051f2b2a9e24cfd877aa7fc3bc170bc4"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v1.0.2/caffeine-1.0.2-macos-arm64.tar.gz"
    sha256 "a15cee6057856a87cd1198b6682f5a23bcd53233fe7a0f54ebd4352da273a8e4"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v1.0.2/caffeine-1.0.2-linux-x64.tar.gz"
    sha256 "78d1cd41475b8f0996dfeed6e0f8657d1f5c677d58a39eed699fdf923058f8a1"
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
