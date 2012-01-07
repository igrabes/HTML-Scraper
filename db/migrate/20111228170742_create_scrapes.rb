class CreateScrapes < ActiveRecord::Migration
  def self.up
    create_table :scrapes do |t|   
      t.string :url
      t.string :title
      t.string :image
      t.datetime :post_date

      t.timestamps
    end
  end

  def self.down
    drop_table :scrapes
  end
end
