class Complgen < Formula
  version "0.1.2"
  desc "complgen"
  homepage "https://github.com/adaszko/complgen"
  url "https://github.com/adaszko/complgen/archive/v#{version}.tar.gz"
  sha256 "df2a1980d591408df37b5437d0e21ca03e7d63478983a48cc62173e18a4d2386"

  depends_on "rust" => :build
  depends_on "bash-completion"

  def install
    system "cargo", "install", "--no-track", "--root", prefix, "--path", "."
  end

  test do
    system "complgen"
  end
end
