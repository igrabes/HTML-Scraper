require 'open-uri'

class Scrape < ActiveRecord::Base      
  
  attr_accessor :title
  
  validates_uniqueness_of :image 
  
  
  url = "http://www.electronicaoasis.com"
  doc = Nokogiri::HTML(open(url))



  doc.css(".hentry").each do |entry|
    title = entry.at_css("h2 a").text unless title
      if entry.at_css(".size-full") != nil
        image = entry.at_css(".size-full")[:src]
      else
        image = "there is no image"
      end 
    post_date = entry.at_css(".postdate").text
    url = entry.at_css("h2 a")[:href] unless url 

      # article_info = Nokogiri::HTML(open(url)) 

      # para_info = (article_info/"p").text
    
    @scrape = Scrape.new(
      :title => title,
      :url => url,
      :image => image,
      :post_date => post_date )
      # :para_info => para_info)                

    unless @scrape.title = nil
      @scrape.save 
    end  
  end   
  
  # raise puts @scrape.inspect        
  
end
