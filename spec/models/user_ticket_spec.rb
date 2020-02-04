require 'rails_helper'

RSpec.describe UserTicket, type: :model do
  let(:user_ticket) { FactoryBot.build(:user_ticket) }

  describe 'schema' do
    it { should have_db_column(:ticket_id).of_type(:integer) }
    it { should have_db_column(:user_id).of_type(:integer) }
  end

  describe 'create' do
    it { expect { user_ticket.save }.to change(UserTicket, :count).by(1) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:ticket) }
    it { should have_one(:draw_winner).class_name('Draw') }
    it { should have_many(:draw_participants) }
  end
end
