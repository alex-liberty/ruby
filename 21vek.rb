require 'pp'
require 'nokogiri'
require 'open-uri'
require 'csv'

url = 'https://www.21vek.by/mobile/'
html = open(url)

doc = Nokogiri::HTML(html)

showings = doc.xpath('//ul[@class="b-result"]/li').map do |showing|
  showing = {name: showing.xpath('.//span[@class="result__name"]/text()').text,
             price: showing.xpath('.//span[@data-price]/@data-price').text,
             code: showing.xpath('.//span[@class="g-code"]/text()').text}
end
url = 'https://www.21vek.by/mobile/'
html = open(url)
doc = Nokogiri::HTML(html)
showings = doc.xpath('//dd[@class="result__desc"]/tr').map do |showing|
  showing =  {diagon: showing.xpath('.//td[@class="result__attr_var"]/text()').text,
              diagonal: showing.xpath('.//td[@class="result__attr_val"]/text()').text}
end



url = doc.xpath('(//div[@id="j-paginator"]//*[@name="2"]/@href)[1]').text
puts url
html = open(url)

doc = Nokogiri::HTML(html)
puts "____________________________________________________________"
showings = doc.xpath('//ul[@class="b-result"]/li').map do |showing|
  puts showing.xpath('.//span[@class="result__name"]/text()').text + " - " + showing.xpath('.//span[@data-price]/@data-price').text + " - " +showing.xpath('.//span[@class="g-code"]/text()').text
end
html = open(url)
doc = Nokogiri::HTML(html)
puts "____________________________________________________________"
showings = doc.xpath('//dd[@class="result__desc"]/tr').map do |showing|
  puts showing.xpath('.//td[@class="result__attr_var"]/text()').text + "-" + showing.xpath('.//td[@class="result__attr_val"]/text()').text
end