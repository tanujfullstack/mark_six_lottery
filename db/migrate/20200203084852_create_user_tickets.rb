class CreateUserTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :user_tickets do |t|

      t.references :ticket, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
