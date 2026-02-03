class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "4.0.8"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.0.8/caffeine-4.0.8-macos-x64.tar.gz"
    sha256 "875c351d62b97aa83d425117591e5eaf34bf300bcf3cc187a8af3148aab0328d"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.0.8/caffeine-4.0.8-macos-arm64.tar.gz"
    sha256 "8552e7405173300c77e7189efa79636594a3de09d856ca309a4d90a7784a144c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.0.8/caffeine-4.0.8-linux-x64.tar.gz"
    sha256 "df2dff28d27a60118404ca78aec7e1cedfacdb12c556081ded34594811de186e"
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
