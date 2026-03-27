class Reelquotes < Formula
  desc "Display a random movie quote in your terminal"
  homepage "https://reelquotes.app"
  version "1.1.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/cainseing/reelquotes-cli/v1.1.0/bin/reelquotes-darwin-arm64"
      sha256 "85c67b351c33f222720a4f1307a38af9fef19bd0d689771ff2b3cc61565f1913"
    else
      url "https://raw.githubusercontent.com/cainseing/reelquotes-cli/v1.1.0/bin/reelquotes-darwin-amd64"
      sha256 "080f571bd140c63e12b5e91ff3694997a1291291316089edb81b3ddd8043b9dc"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/cainseing/reelquotes-cli/v1.1.0/bin/reelquotes-linux-arm64"
      sha256 "159bb2916da14a7dd89c3ce4c7fdea7ea7b9314a0eb6ef0fc4723a19ef5179ca"
    else
      url "https://raw.githubusercontent.com/cainseing/reelquotes-cli/v1.1.0/bin/reelquotes-linux-amd64"
      sha256 "46be707b1ffc29d04e87ec51ec334a79e7137c5eb74c4ebeb81e2c239fcd558a"
    end
  end

  def install
    binary_name = Dir["reelquotes-*"].first
    
    if binary_name.nil?
      odie "Binary not found in download. Check your URL/Tag."
    end

    bin.install binary_name => "reelquotes"
  end
end
