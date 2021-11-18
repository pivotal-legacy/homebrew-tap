require 'formula'

# The tc Server homebrew tap has been decommissioned. 
# Please visit https://network.tanzu.vmware.com/ to download

class Tcserver < Formula
  homepage 'http://tcserver.docs.pivotal.io/index.html'
  # brew needs something to download and since the bits are no longer available this allows that process to pass 
  # allowing the message to be presented to the user
  url 'https://github.com/pivotal-legacy/homebrew-tap/blob/9b7682ca3281b400b79bad71102d60c3871ead12/README-tcserver.md'
  sha256 '7342774fb3828724bff334b67a070459376fa5e13519a8c3567ca0e12902faae'
  # This causes brew to update to show the error message.
  version '4.1.9999'

  def install
    ohai "tc Server tap is no longer available!"

    odie "Please download and install from Tanzu Network https://network.tanzu.vmware.com/"

  end
end
