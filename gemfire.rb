require 'formula'

class Gemfire < Formula
  homepage 'http://www.pivotal.io/big-data/pivotal-gemfire'
  url 'http://download.pivotal.com.s3.amazonaws.com/gemfire/8.0.0/Pivotal_GemFire_800_b48398_Linux.zip'
  sha1 'a117214aeb07a20893649eabf295fca77b30ed0b'
  version "8.0.0"
  
  def install
    # Remove Windows scripts
    rm_rf Dir['**/*.bat']

    # Install files
    prefix.install %w{ EULA.txt lib/open_source_licenses-Pivotal_GemFire_8.0.txt}
    libexec.install Dir['*']
    bin.write_exec_script libexec/'bin/agent'
    bin.write_exec_script libexec/'bin/cacheserver'
    bin.write_exec_script libexec/'bin/gemfire'
    bin.write_exec_script libexec/'bin/gfsh'
  end

  def caveats; <<-EOS.undent
    By installing, you agree to comply with the license at http://www.pivotal.io/products/software-license-agreement. If you disagree with these terms, please uninstall by typing "brew uninstall gemfire" in your terminal window.

    Usage:
       gfsh
       cacheserver
       gemfire
       agent
          
    Documentation:
       http://gemfire.docs.pivotal.io/index.html

    EOS
  end
end
