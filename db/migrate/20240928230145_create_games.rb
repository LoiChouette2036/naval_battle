class CreateGames < ActiveRecord::Migration[7.2]
  def change
    create_table :games do |t|
      t.references :creator, null: false, foreign_key: { to_table: :users }
      t.references :opponent, null: true, foreign_key: { to_table: :users }
      t.string :state

      t.timestamps
    end
  end
end
