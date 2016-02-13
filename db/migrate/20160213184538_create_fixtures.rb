class CreateFixtures < ActiveRecord::Migration
  def change
    create_table :fixtures do |t|
    	t.string :league
    	t.string :home_team
    	t.string :away_team
    	t.integer :home_score
    	t.integer :away_score
    	t.datetime :match_time

      t.timestamps
    end
  end
end
