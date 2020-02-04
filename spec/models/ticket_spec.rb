require 'rails_helper'

RSpec.describe Ticket, type: :model do
  let(:ticket) { FactoryBot.build(:ticket) }

  describe 'schema' do
    it { should have_db_column(:title).of_type(:string) }
    it { should have_db_column(:winning_amount).of_type(:decimal) }
  end

  describe 'create' do
    it { expect { ticket.save }.to change(Ticket, :count).by(1) }
  end

  describe 'associations' do
    it { should have_many(:user_tickets) }
    it { should have_many(:users).through(:user_tickets) }
    it { should have_many(:draws) }
  end
end
