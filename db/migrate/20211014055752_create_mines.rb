class CreateMines < ActiveRecord::Migration[6.1]
  def change
    create_table :mines do |t|
      t.integer :game_id
      t.integer :x
      t.integer :y

      t.timestamps
    end
  end
end
