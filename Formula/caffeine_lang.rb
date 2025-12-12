class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  version "0.2.11"
  license "GPL-3.0-only"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v0.2.11/caffeine-0.2.11-macos-x64.tar.gz"
    sha256 "5b031888f392672fd016922794491e52e6edf191ae5b4df0585db43a699b6a5a"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v0.2.11/caffeine-0.2.11-macos-arm64.tar.gz"
    sha256 "9784f64b728780debe7dd23c790cdae43779b33e97746c379f8ddea651b3006a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v0.2.11/caffeine-0.2.11-linux-x64.tar.gz"
    sha256 "6007bee470172b56dbc0428e338ee6fde602a1d588520d9b8eff0acea4ddd646"
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
