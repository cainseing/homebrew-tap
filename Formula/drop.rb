class Drop < Formula
  desc "Secure, zero-knowledge, secret sharing CLI"
  homepage "https://getdrop.dev"
  version "0.1.0-beta" # Remember to bump this with your releases
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/cainseing/drop-cli/v0.1.0-beta/bin/drop-darwin-arm64"
      sha256 "4567b1e0b107b91011a38bc6b9ad9a3703032723175f45e29adfd3ad85f5beee"
    else
      url "https://raw.githubusercontent.com/cainseing/drop-cli/v0.1.0-beta/bin/drop-darwin-amd64"
      sha256 "957e7d466b4119356912f148df520393dfc991c65403db3fa22e4266d1b00b6b"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/cainseing/drop-cli/v0.1.0-beta/bin/drop-linux-arm64"
      sha256 "ad6761a8f5e8c79da29d9aba4bd71823e2b76b18616cf0ca9b23df3d98f39b64"
    else
      url "https://raw.githubusercontent.com/cainseing/drop-cli/v0.1.0-beta/bin/drop-linux-amd64"
      sha256 "82391cb0199f9f4d261a9a5edad7acc41b8c87bfc14bab0f2ae4a99f74360338"
    end
  end

  def install
    # Dynamically find the downloaded binary and install it as 'drop'
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
