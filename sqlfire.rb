require 'formula'

class Sqlfire < Formula
  homepage 'http://gopivotal.com/products/pivotal-sqlfire'
  url 'http://download.pivotal.com.s3.amazonaws.com/sqlfire/1.1.2/Pivotal_SQLFire_112_b45732.zip'
  sha1 '743280517fbf02bb7d38c1748a3a0b6b36cb9d7d'
  version "1.1.2"
  
  def install
    # Remove Windows scripts
    rm_rf Dir['**/*.bat']

    # Install files
    prefix.install %w{ EULA.txt lib/open_source_licenses-Pivotal_SQLFire_1.1.2.txt}
    libexec.install Dir['*']
    bin.write_exec_script libexec/'bin/sqlf'
  end

  def caveats; <<-EOS.undent
    By installing, you agree to comply with the license at http://gopivotal.com/products/software-license-agreement. If you disagree with these terms, please uninstall by typing "brew uninstall sqlfire" in your terminal window.
 
    Usage:
       sqlf
          
    Documentation:
       http://docs.gopivotal.com/sqlfire/index.html

    EOS
  end
end
