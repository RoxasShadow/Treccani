#
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#                    Version 2, December 2004
#
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
#
#  0. You just DO WHAT THE FUCK YOU WANT TO.
#

class Citazione < Treccani
  def get
    {}.tap { |result|
      page = Nokogiri::HTML open(@server)
      result[:citazione] = page.at_xpath('//p[@class="citazione"]').text.strip
      result[:autore]    = page.at_xpath('//p[@class="autore"]').text.strip
    }
  end
end