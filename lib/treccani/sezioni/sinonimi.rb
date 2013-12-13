#
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#                    Version 2, December 2004
#
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
#
#  0. You just DO WHAT THE FUCK YOU WANT TO.
#

class Sinonimi < Treccani
  def get(word)
    page = Nokogiri::HTML open("#{@server}#{get_url(word)}")
    page.at_xpath('//div[@class="spiega attacco"]/p').text.strip
  end
    alias_method :find, :get

  def get_url(word)
    url = Nokogiri::HTML(open("#{@server}/vocabolario/ricerca/#{word}/Sinonimi_e_Contrari/")).at_xpath('//li[@class="result fs"]/h2/a/@href').to_s
    raise 'Term not found.' if url.empty?
    url
  end
end