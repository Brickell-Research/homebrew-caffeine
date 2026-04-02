class Octo < Formula
  desc "Architecture-aware AI coding assistant"
  homepage "https://github.com/Brickell-Research/octo"
  license "MIT"

  # stable-start managed by octo release workflow
  url "https://github.com/Brickell-Research/octo/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "f9aa263fbb4cf982cefd9490ef2d305eb08bc08232bc38cfa465047d3b72e1a5"
  version "0.4.0"
  # stable-end

  depends_on "ruby"

  def install
    # Remove pre-built vendor artifacts from the source tarball so
    # native extensions are compiled against Homebrew's Ruby.
    rm_rf "vendor/bundle"
    rm_rf "gems"
    rm_rf ".bundle"

    libexec.install Dir["*"]
    cd libexec do
      system "bundle", "config", "set", "--local", "path", "vendor/bundle"
      system "bundle", "config", "set", "--local", "without", "development:test"
      system "bundle", "install"
    end
    (bin/"octo").write_env_script libexec/"bin/octo",
      PATH: "#{Formula["ruby"].opt_bin}:$PATH"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/octo version")
  end
end
