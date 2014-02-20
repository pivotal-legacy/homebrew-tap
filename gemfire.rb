require 'formula'

class Gemfire < Formula
  homepage 'http://gopivotal.com/products/pivotal-gemfire'
  url 'http://downloads.cfapps.io/gemf_zip'
  sha1 '69a138baa30e99d30fc98312e535481afd5c0ad8'
  version "7.0.2"
  
  def install
    # Remove Windows scripts
    rm_rf Dir['**/*.bat']

    # Install files
    prefix.install %w{ EULA.txt lib/open_source_licenses-Pivotal_GemFire_7.0.2.txt}
    libexec.install Dir['*']
    bin.write_exec_script libexec/'bin/agent'
    bin.write_exec_script libexec/'bin/cacheserver'
    bin.write_exec_script libexec/'bin/gemfire'
    bin.write_exec_script libexec/'bin/gfsh'
  end

  def caveats; <<-EOS.undent
    By installing, you agree to comply with the license at http://gopivotal.com/products/software-license-agreement. If you disagree with these terms, please uninstall by typing "brew uninstall gemfire" in your terminal window.

    Usage:
       gfsh
       cacheserver
       gemfire
       agent
          
    Documentation:
       http://docs.gopivotal.com/gemfire/index.html

    EOS
  end
end
