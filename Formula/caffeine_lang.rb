class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "4.0.11"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.0.11/caffeine-4.0.11-macos-x64.tar.gz"
    sha256 "c516d1de460086e8877b11257fd57eb53d01e79c632624a3cebd69840419f635"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.0.11/caffeine-4.0.11-macos-arm64.tar.gz"
    sha256 "1fe5585bef20d16ee98a67e88a3c2ee7321917711f9da0bcac1907eae8eb1e9d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.0.11/caffeine-4.0.11-linux-x64.tar.gz"
    sha256 "977b70e0a57e86ad8832c36322706f310613e6b15486dc8d47b743ab64edd573"
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
