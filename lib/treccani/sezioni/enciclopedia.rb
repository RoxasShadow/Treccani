#
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#                    Version 2, December 2004
#
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
#
#  0. You just DO WHAT THE FUCK YOU WANT TO.
#

class Enciclopedia < Treccani
  def get(word)
    page = Nokogiri::HTML open("#{@server}#{get_url(word)}")
    {}.tap { |result|
      page = page.xpath '//div[@class="spiega attacco"]/p'
      result[:lemma]    = page.shift.text.strip
      result[:meanings] = page.map { |m| m.text.strip }
      result[:meaning]  = result[:meanings].join.strip
    }
  end
    alias_method :find, :get

  def get_url(word)
    url = Nokogiri::HTML(open("#{@server}/enciclopedia/ricerca/#{word}/")).at_xpath('//ol[@class="listing"]/li/h2/a/@href').to_s
    raise 'Term not found.' if url.empty?
    url
  end
end