class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :name
      t.integer :width
      t.integer :height
      t.string :email
      t.integer :number_of_mines

      t.timestamps
    end
  end
end
