require 'formula'

class Gemfire < Formula
  homepage 'http://www.pivotal.io/big-data/pivotal-gemfire'
  url 'http://download.pivotal.com.s3.amazonaws.com/gemfire/8.2.1/Pivotal_GemFire_821_b18207_Linux.zip'
  sha256 '16bb872b263f259de97008b6464607c6c5990ce71aef12caa4e77446c01cfd13'
  version "8.2.1"
  
  def install
    # Remove Windows scripts
    rm_rf Dir['**/*.bat']

    # Install files
    prefix.install %w{ EULA.txt lib/open_source_licenses-Pivotal_GemFire_8.2.1.txt}
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
