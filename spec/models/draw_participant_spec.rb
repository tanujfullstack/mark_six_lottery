require 'rails_helper'

RSpec.describe DrawParticipant, type: :model do
  let(:draw_participant) { FactoryBot.build(:draw_participant) }

  describe 'schema' do
    it { should have_db_column(:draw_id).of_type(:integer) }
    it { should have_db_column(:user_ticket_id).of_type(:integer) }
  end

  describe 'create' do
    it { expect { draw_participant.save }.to change(DrawParticipant, :count).by(1) }
  end

  describe 'associations' do
    it { should belong_to(:user_ticket) }
    it { should belong_to(:draw) }
  end
end
