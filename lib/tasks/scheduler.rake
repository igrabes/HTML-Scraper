desc "This task is called by the Heroku scheduler add-on"
task :scrape => :environment do
    puts "Updating scrape..."
    Scrape.new
    puts "done."
end
