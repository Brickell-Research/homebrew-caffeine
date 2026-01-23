class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "3.0.8"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.8/caffeine-3.0.8-macos-x64.tar.gz"
    sha256 "30fbcbcb2281cf4da5f9a705b12328602510b454738398646378e9884eac0aae"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.8/caffeine-3.0.8-macos-arm64.tar.gz"
    sha256 "f5e2cbd22afc5f6d7ef23e0b0b94353d2c809a54b911c9ecdc73d57dd668c5be"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.8/caffeine-3.0.8-linux-x64.tar.gz"
    sha256 "f4508252cfe4a12c1d4315c56986c05b712546834438ad7bda430b991171c89e"
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
