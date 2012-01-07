class ScrapesController < ApplicationController 
  
  
  def index
    @scrapes = Scrape.all
  end
  
  def new
    @scrapes = Scrape.all 
    @scrape = Scrape.new(
      :title => @title,
      :url => @url,
      :image => @image,
      :post_date => @post_date )
      
    @scrape.save
  end 
  
  def update
    @scrape = Scrape.new(
      :title => @title,
      :url => @url,
      :image => @image,
      :post_date => @post_date )
      
    @scrape.save
  end
  
  def destroy
    @scrape = Scrape.find(params[:id])   
    @scrape.destroy
    
    respond_to do |format|
       format.html { redirect_to(scrapes_path) }
       format.xml  { head :ok }
     end
  end
end
