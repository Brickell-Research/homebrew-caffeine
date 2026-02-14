class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "4.4.0"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.4.0/caffeine-4.4.0-macos-x64.tar.gz"
    sha256 "f753ec70ff54ef5f8cece245bbe0b4b7019cdc838c235da0364b2fd32c964cc2"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.4.0/caffeine-4.4.0-macos-arm64.tar.gz"
    sha256 "2fb921a08477f244c0ed450088384ca43528e7eeafb9481f4cb4fd8d93334622"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.4.0/caffeine-4.4.0-linux-x64.tar.gz"
    sha256 "1bbfdc28ccbfc4a77b7d4fac3060e665c8ddd872f36a07dc1f74440c216a63fe"
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
