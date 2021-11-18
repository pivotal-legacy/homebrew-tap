require 'formula'

# The tc Server homebrew tap has been decommissioned. 
# Please visit https://network.tanzu.vmware.com/ to download

class Tcserver < Formula
  homepage 'http://tcserver.docs.pivotal.io/index.html'
  # brew needs something to download and since the bits are no longer available this allows that process to pass 
  # allowing the message to be presented to the user
  url 'https://github.com/pivotal-legacy/homebrew-tap/blob/9b7682ca3281b400b79bad71102d60c3871ead12/README-tcserver.md'
  sha256 '69775ef07b286d6deb83f1f24e9c016a39c9ce7ebab828398a50f1e4568b20aa'
  # This causes brew to update to show the error message.
  version '4.1.9999'

  def install
    ohai "tc Server tap is no longer available!"

    odie "Please download and install from Tanzu Network https://network.tanzu.vmware.com/"

  end
end
