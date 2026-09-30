class Portscope < Formula
  desc "Menu bar radar for your dev servers on localhost"
  homepage "https://github.com/Fuasmattn/portscope"
  url "https://github.com/Fuasmattn/portscope/releases/download/v0.1.1/Portscope-0.1.1-macos-arm64.tar.gz"
  sha256 "b3d0199c2c70aa575c03bb0e1205806b05481afc251859460005a4f1d1fa1d09"
  license "MIT"
  version "0.1.1"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  def install
    bin.install "Portscope"
  end

  service do
    run [opt_bin/"Portscope"]
    keep_alive crashed: true
    process_type :interactive
    log_path var/"log/portscope.log"
    error_log_path var/"log/portscope.log"
  end

  def caveats
    <<~EOS
      Portscope is a menu bar app. Start it now and at login with:
        brew services start portscope
    EOS
  end

  test do
    assert_match "Portscope 0.1.1", shell_output("#{bin}/Portscope --version")
  end
end
