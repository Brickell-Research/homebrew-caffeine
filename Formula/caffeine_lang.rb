class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "3.0.5"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.5/caffeine-3.0.5-macos-x64.tar.gz"
    sha256 "60784d112c4e0379b6d3dd23bd76af25a9e65ceeb180bb9c181e174d41e3c981"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.5/caffeine-3.0.5-macos-arm64.tar.gz"
    sha256 "9e4ae425bc44ba688b6cd794521d3bfdbe70f0b24cc93e145a3aae51400c5a63"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.5/caffeine-3.0.5-linux-x64.tar.gz"
    sha256 "824ce02fbb5c16b200b567deb1363b76c8dac99784631661a379f5199b552204"
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
