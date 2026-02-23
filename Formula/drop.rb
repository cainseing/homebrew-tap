class Drop < Formula
  desc "Secure, zero-knowledge, secret sharing CLI"
  homepage "https://getdrop.dev"
  version "0.2.0-beta" # Remember to bump this with your releases
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/cainseing/drop-cli/v0.2.0-beta/bin/drop-darwin-arm64"
      sha256 "09813296d069da898f3edf8d0ce9de969f49c8b158fd4de23691bad9e8c98b0e"
    else
      url "https://raw.githubusercontent.com/cainseing/drop-cli/v0.2.0-beta/bin/drop-darwin-amd64"
      sha256 "2ed04543055f4706c72e54e67f4df4304eb3f9210b97e42c41a9257a083a8894"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/cainseing/drop-cli/v0.2.0-beta/bin/drop-linux-arm64"
      sha256 "8f9f12383391ec78abe8359dc81c59a9b51c2fed5e5e033d3c29f84905cb936e"
    else
      url "https://raw.githubusercontent.com/cainseing/drop-cli/v0.2.0-beta/bin/drop-linux-amd64"
      sha256 "23a910f960b4c8fcbe7d76af7a81d6eba8807a666e9253c60d86ecb38232cddf"
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
