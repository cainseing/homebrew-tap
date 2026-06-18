class Drop < Formula
  desc "Secure, zero-knowledge, secret sharing CLI"
  homepage "https://getdrop.dev"
  version "0.5.1-beta"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/cainseing/drop-cli/v0.5.1-beta/bin/drop-darwin-arm64"
      sha256 "7759393676f773258110d6062493d7da43691f6174eb95e5e6ce3927e24c58ff"
    else
      url "https://raw.githubusercontent.com/cainseing/drop-cli/v0.5.1-beta/bin/drop-darwin-amd64"
      sha256 "67facb39f128f1d03d998e97dcf2b134e247866a14cd64bccf2279c463c962ac"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/cainseing/drop-cli/v0.5.1-beta/bin/drop-linux-arm64"
      sha256 "c860529a6dd172a5cca8e568ab155d5b532b2ea88d7fb87c485eeb2cbe72c7aa"
    else
      url "https://raw.githubusercontent.com/cainseing/drop-cli/v0.5.1-beta/bin/drop-linux-amd64"
      sha256 "30e1bdd4f05a65f4fdecbefea043b0a8f722626e25aae0522ea301d4f75600df"
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
