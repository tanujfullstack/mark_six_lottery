require 'rails_helper'

RSpec.describe Draw, type: :model do
  let(:draw) { FactoryBot.build(:draw) }

  describe 'schema' do
    it { should have_db_column(:title).of_type(:string) }
    it { should have_db_column(:ticket_id).of_type(:integer) }
    it { should have_db_column(:winner_user_ticket_id).of_type(:integer) }
  end

  describe 'create' do
    it { expect { draw.save }.to change(Draw, :count).by(1) }
  end

  describe 'associations' do
    it { should belong_to(:ticket) }
    it { should belong_to(:winner_user_ticket).class_name('UserTicket').optional(:true) }
    it { should have_many(:draw_participants) }
  end
end
