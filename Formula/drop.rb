class Drop < Formula
  desc "Secure, zero-knowledge, secret sharing CLI"
  homepage "https://getdrop.dev"
  version "0.2.1-beta" # Remember to bump this with your releases
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/cainseing/drop-cli/v0.2.1-beta/bin/drop-darwin-arm64"
      sha256 "0b4fa075bb27d8ad647eead3ef159d112362d56a6fe1156e30b3a1be1f1b5776"
    else
      url "https://raw.githubusercontent.com/cainseing/drop-cli/v0.2.1-beta/bin/drop-darwin-amd64"
      sha256 "93489f4761c771b9dca0283213b14935803b90ee647b10ed84e24f947ee6720a"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/cainseing/drop-cli/v0.2.1-beta/bin/drop-linux-arm64"
      sha256 "5c9734899f739d5c9a3666a1dfa437782e44b2ef9984f5e410105d3271b635aa"
    else
      url "https://raw.githubusercontent.com/cainseing/drop-cli/v0.2.1-beta/bin/drop-linux-amd64"
      sha256 "9fa8e36c6a44b06045d07a9a310e2dfbdae14117f80879256711c0e43c70a1f0"
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
