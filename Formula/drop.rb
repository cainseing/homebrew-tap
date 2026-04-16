class Drop < Formula
  desc "Secure, zero-knowledge, secret sharing CLI"
  homepage "https://getdrop.dev"
  version "0.4.0-beta"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/cainseing/drop-cli/v0.4.0-beta/bin/drop-darwin-arm64"
      sha256 "d836e791b73fac067b257505b17b2ab81fdbd67bfc63fd285d2336096b547376"
    else
      url "https://raw.githubusercontent.com/cainseing/drop-cli/v0.4.0-beta/bin/drop-darwin-amd64"
      sha256 "99893834846e9793fc427edb2e37a8e5c5ac2aa5888cf2832ed74295d37a0fc1"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/cainseing/drop-cli/v0.4.0-beta/bin/drop-linux-arm64"
      sha256 "408b578c6da8dc45b1f58568293696ca32e73a712316b4edfef3c9f085b373d8"
    else
      url "https://raw.githubusercontent.com/cainseing/drop-cli/v0.4.0-beta/bin/drop-linux-amd64"
      sha256 "a69fd4c81f0eb4931e80c5f0dd56501e6c450c430cf21c90164f3dbcca8fe860"
    end
  end

  def install
    binary_name = Dir["drop-*"].first
    
    if binary_name.nil?
      odie "Binary not found in download. Check your URL/Tag."
    end

    bin.install binary_name => "drop"
  end

  test do
    assert_match "drop version", shell_output("#{bin}/drop --version")
  end
end
