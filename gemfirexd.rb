require 'formula'

class Gemfirexd < Formula
  homepage 'http://www.pivotal.io/big-data/pivotal-gemfire-xd'
  url 'http://download.pivotal.com.s3.amazonaws.com/gemfirexd/1.3.1/Pivotal_GemFireXD_131_b49833_Linux.zip'
  sha1 '1ebf1cefd757363eb9512ffeb48b5a64d39095d8'
  version "1.3.1"
  
  def install
    # Remove Windows scripts
    rm_rf Dir['**/*.bat']

    # Install files
    prefix.install %w{ EULA.txt lib/open_source_licenses-Pivotal_GemFireXD_1.3.1.txt}
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
