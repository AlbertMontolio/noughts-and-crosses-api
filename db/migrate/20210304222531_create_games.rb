class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.integer :creator_id
      t.integer :joiner_id

      t.timestamps
    end
  end
end
