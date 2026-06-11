class Manatee < Formula
  desc "Self adapting agent harness"
  homepage "https://github.com/Brickell-Research/manatee"
  version "0.1.1"
  url "https://github.com/Brickell-Research/manatee/releases/download/v0.1.1/manatee-0.1.1.tar.gz"
  sha256 "1291cd8d998f85188d21c2c02a31d0cc6162a1186cdb3b6a44850be0fc91fde4"

  depends_on "erlang"

  def install
    libexec.install Dir["*"]
    (bin/"manatee").write <<~SCRIPT
      #!/bin/bash
      export PATH="#{Formula["erlang"].opt_bin}:$PATH"
      exec "#{libexec}/entrypoint.sh" run "$@"
    SCRIPT
  end

  test do
    assert_match "manatee", shell_output("#{bin}/manatee < /dev/null")
  end
end
