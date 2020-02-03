class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|

      t.string :title
      t.decimal :winning_amount, precision: 10, scale: 2, null: false
    end

    add_index :tickets, :title, unique: true
  end
end
