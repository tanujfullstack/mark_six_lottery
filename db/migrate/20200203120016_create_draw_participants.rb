class CreateDrawParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :draw_participants do |t|
      t.references :draw, index: true, foreign_key: true
      t.references :user_ticket, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
