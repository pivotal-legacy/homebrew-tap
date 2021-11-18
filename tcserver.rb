require 'formula'

# The tc Server homebrew tap has been decommissioned. 
# Please visit https://network.tanzu.vmware.com/ to download

class Tcserver < Formula
  homepage 'http://tcserver.docs.pivotal.io/index.html'
  # brew needs something to download and since the bits are no longer available this allows that process to pass 
  # allowing the message to be presented to the user
  url 'http://tcserver.docs.pivotal.io/index.html'
  sha256 'df2c8b64b2e3e06a060f76f1f0f7bf9e668040e19324533a24e19a0976dab8b7'
  # This causes brew to update to show the error message.
  version '4.1.9999'

  def install
    ohai "tc Server tap is no longer available!"

    odie "Please download and install from Tanzu Network https://network.tanzu.vmware.com/"

  end
end
