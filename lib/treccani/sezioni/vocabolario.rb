#
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#                    Version 2, December 2004
#
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
#
#  0. You just DO WHAT THE FUCK YOU WANT TO.
#

class Vocabolario < Treccani
  def get(word)
    {}.tap { |result|
      page = Nokogiri::HTML open("#{@server}#{get_url(word)}")
      wot  = page.at_xpath('//div[@class="spiega attacco"]/p').to_s.split '<br><br>'
      result[:lemma]    = wot.shift.remove_tags[0..-4].strip
      result[:meanings] = wot.join.split(/<strong>[0-9]\.<\/strong>/i).map { |m| m.remove_tags.strip }[1..-1]
    }
  end
    alias_method :find, :get

  private
  def get_url(word)
    url = Nokogiri::HTML(open("#{@server}/vocabolario/tag/#{word}/")).at_xpath('//li[@class="result fs"]/h2/a/@href').to_s
    raise 'Term not found.' if url.empty?
    url
  end
end