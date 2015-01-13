require 'formula'

class Gemfirexd < Formula
  homepage 'http://www.pivotal.io/big-data/pivotal-gemfire-xd'
  url 'http://download.pivotal.com.s3.amazonaws.com/gemfirexd/1.4.0/Pivotal_GemFireXD_140_b50226_Linux.zip'
  sha1 '9856f8f2eaa9b3f5e46d4112ec757f077fb0af10'
  version "1.4.0"
  
  def install
    # Remove Windows scripts
    rm_rf Dir['**/*.bat']

    # Install files
    prefix.install %w{ EULA.txt lib/open_source_licenses-Pivotal_GemFireXD_1.4.0.txt}
    libexec.install Dir['*']
    bin.write_exec_script libexec/'bin/color'
    bin.write_exec_script libexec/'bin/dataextractloader'
    bin.write_exec_script libexec/'bin/dataextractor'
    bin.write_exec_script libexec/'bin/sqlf'
    bin.write_exec_script libexec/'bin/gfxd'
  end

  def caveats; <<-EOS.undent
    By installing, you agree to comply with the license at http://www.pivotal.io/products/software-license-agreement. If you disagree with these terms, please uninstall by typing "brew uninstall gemfirexd" in your terminal window.

    Usage:
       color
       dataextractloader
       dataextractor
       gfxd
       sqlf
          
    Documentation:
       http://docs.pivotal.io/gemfirexd/index.html

    EOS
  end
end
