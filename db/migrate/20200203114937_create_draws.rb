class CreateDraws < ActiveRecord::Migration[5.2]
  def change
    create_table :draws do |t|
      t.string :title, null: false
      t.references :ticket, index: true, foreign_key: true
      t.integer :winner_user_ticket_id, index: true
      t.foreign_key :user_tickets, column: :winner_user_ticket_id
      t.timestamps null: false
    end
    add_index :draws, :title, unique: true
  end
end
