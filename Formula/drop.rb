class Drop < Formula
  desc "Secure, zero-knowledge, secret sharing CLI"
  homepage "https://getdrop.dev"
  version "0.3.0-beta"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/cainseing/drop-cli/v0.3.0-beta/bin/drop-darwin-arm64"
      sha256 "963c9fec6e9e550946d72ef2b51f16eb2309e375785642da17951b7c87358c43"
    else
      url "https://raw.githubusercontent.com/cainseing/drop-cli/v0.3.0-beta/bin/drop-darwin-amd64"
      sha256 "b032affb61ddf1143887a1b12ddb0b9d01d6ab7c05425e7b4d89370a1b19bbec"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/cainseing/drop-cli/v0.3.0-beta/bin/drop-linux-arm64"
      sha256 "593ad5b87616aeade8308a71e5fa84928523a3cf4d83e0b2af6e28c4b3f92758"
    else
      url "https://raw.githubusercontent.com/cainseing/drop-cli/v0.3.0-beta/bin/drop-linux-amd64"
      sha256 "30d59cd26405089340b1310d999972516adae126a993a1055949a90721cd1220"
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
