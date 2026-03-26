class Reelquotes < Formula
  desc "Display a random movie quote in your terminal"
  homepage "https://reelquotes.app"
  version "1.0.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/cainseing/reelquotes-cli/v1.0.0/bin/reelquotes-darwin-arm64"
      sha256 "43e66745766bd183f363f82ae973f8bf1d2b3058397ab9a86f15b1a95dc556c5"
    else
      url "https://raw.githubusercontent.com/cainseing/reelquotes-cli/v1.0.0/bin/reelquotes-darwin-amd64"
      sha256 "bbcc93303fc317b7bdf948363d2d59eb3c43edc5224f70d6d7547107aea47067"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/cainseing/reelquotes-cli/v1.0.0/bin/reelquotes-linux-arm64"
      sha256 "96112483e6337993ec8428c2cf78a2f04298b8bfb3c160d8ff03f903a23d2fd4"
    else
      url "https://raw.githubusercontent.com/cainseing/reelquotes-cli/v1.0.0/bin/reelquotes-linux-amd64"
      sha256 "0243c7fba24d821a7060700f5169d67e43af83f7990c0ef160cfad04072f3f67"
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
