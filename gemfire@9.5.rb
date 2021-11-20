require 'formula'

# The GemFire homebrew tap has been decommissioned. 
# Please visit https://network.tanzu.vmware.com/ to download

class GemfireAT95 < Formula
  homepage 'https://gemfire.docs.pivotal.io/910/gemfire/about_gemfire.html'
  # brew needs something to download and since the bits are no longer available this allows that process to pass 
  # allowing the message to be presented to the user
  url 'https://raw.githubusercontent.com/pivotal-legacy/homebrew-tap/7e8579706684115d90ce95dfcc9a15a84bbc26a9/README-gemfire.md'
  sha256 '70a297b5c1a5195a40675f1e2fb880470528e53b837a9e9daebeed5c3110e6a7'
  version '9.5.4'

  def install
    ohai "GemFire tap is no longer available!"

    odie "Please download and install from Tanzu Network https://network.tanzu.vmware.com/"

  end
end
