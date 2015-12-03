class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
    	
    	t.string :title
    	t.string :league
    	t.text :body

      	t.timestamps
    end
  end
end
