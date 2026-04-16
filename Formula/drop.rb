class Drop < Formula
  desc "Secure, zero-knowledge, secret sharing CLI"
  homepage "https://getdrop.dev"
  version "0.4.1-beta"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/cainseing/drop-cli/v0.4.1-beta/bin/drop-darwin-arm64"
      sha256 "94139fcc0f039a140b3ba7f0eb3a1bb79fbb716727c7d1bb3df714a9b7a1a045"
    else
      url "https://raw.githubusercontent.com/cainseing/drop-cli/v0.4.1-beta/bin/drop-darwin-amd64"
      sha256 "2e675e3c786fac4a3e922b9544b2c053f3cfd96327afaab3fcb0cc8577f9b351"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/cainseing/drop-cli/v0.4.1-beta/bin/drop-linux-arm64"
      sha256 "10d25e0e73389e663a73b0dc58d5c83fe72435f5dec6eed8079010ecb9d11a70"
    else
      url "https://raw.githubusercontent.com/cainseing/drop-cli/v0.4.1-beta/bin/drop-linux-amd64"
      sha256 "11f0990a34fa1db39a4266ba27230d8f6dd283e66254c14e3285d7850d8892de"
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
