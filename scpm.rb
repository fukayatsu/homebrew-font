require 'formula'

class Migu1MFonts < Formula
  homepage 'http://mix-mplus-ipa.sourceforge.jp/'
  url      'http://sourceforge.jp/frs/redir.php?m=iij&f=%2Fmix-mplus-ipa%2F59022%2Fmigu-1m-20130617.zip'
  sha1     'a0641894cec593f8bb1e5c2bf630f20ee9746b18'
  version  '20130617'
end

class SourceCodeProFonts < Formula
  homepage 'http://sourceforge.net/projects/sourcecodepro.adobe/'
  url      'http://downloads.sourceforge.net/project/sourcecodepro.adobe/SourceCodePro_FontsOnly-1.017.zip'
  sha1     'c0e3f6f8e25b434c0e28a817539632f8a5ecb9e5'
  version  '1.017'
end

class SCPM < Formula
  homepage 'https://github.com/fukayatsu/scpm'
  url      'https://github.com/fukayatsu/scpm/archive/v0.0.1.tar.gz'
  sha1     '05a830d68b7c9c317099f69f73adbd4926c1c77b'
  version  'v0.0.1'

  depends_on 'fontforge'

  def install
    share_fonts = share + 'fonts'

    Migu1MFonts.new.brew { share_fonts.install Dir[*] }
    SourceCodeProFonts.new.brew { share_fonts.install Dir[*] }

    system 'fontforge', './scpm.pe'

    share_fonts.install Dir['SCPM*.ttf']
  end

  test do
    system 'false'
  end

  def caveats; <<-EOS.undent
    ***************************************************
    Generated files:
      #{Dir[share+'fonts/SCPM*.ttf'].join("\n      ")}
    ***************************************************
    To install SCPM:
      $ cp -f #{share}/fonts/SCPM*.ttf ~/Library/Fonts/
      $ fc-cache -vf
    ***************************************************
    EOS
  end
end