class Complgen < Formula
  version "0.1.3"
  desc "complgen"
  homepage "https://github.com/adaszko/complgen"
  url "https://github.com/adaszko/complgen/archive/v#{version}.tar.gz"
  sha256 "5ec2928d094da0a597e3644e7d2c4d6affdde36ac10e807aa7b8b3c61f4ee0b5"

  depends_on "rust" => :build
  depends_on "bash-completion"

  def install
    system "cargo", "install", "--no-track", "--root", prefix, "--path", "."
  end

  test do
    system "complgen"
  end
end
