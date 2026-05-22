class Drop < Formula
  desc "Secure, zero-knowledge, secret sharing CLI"
  homepage "https://getdrop.dev"
  version "0.5.0-beta"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/cainseing/drop-cli/v0.5.0-beta/bin/drop-darwin-arm64"
      sha256 "a3897ba4ee9cb8cf55219cfee941425709c8f4ddc8f5b92c332239d8c77e8ce3"
    else
      url "https://raw.githubusercontent.com/cainseing/drop-cli/v0.5.0-beta/bin/drop-darwin-amd64"
      sha256 "5d21d60dabb19399d3d4592ee7e645f0bc25da6478639c22f57edf7eb1c3af1a"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/cainseing/drop-cli/v0.5.0-beta/bin/drop-linux-arm64"
      sha256 "3f11c7aefb27a2915de6d6eb0b9ee663f2564ee73d32f23d9fa3520fc7a5f5dd"
    else
      url "https://raw.githubusercontent.com/cainseing/drop-cli/v0.5.0-beta/bin/drop-linux-amd64"
      sha256 "5ad134128b073e4339fa0955cc5788c480965623400de72c0397283dfe0f9238"
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
