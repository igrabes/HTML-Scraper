class PagesController < ApplicationController
  
  def home
     @scraped = Scrape.all
  end

end
