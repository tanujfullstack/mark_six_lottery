require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { FactoryBot.build(:user) }

  describe 'schema' do
    it { should have_db_column(:email).of_type(:string) }
    it { should have_db_column(:encrypted_password).of_type(:string) }
    it { should have_db_column(:reset_password_token).of_type(:string) }
    it { should have_db_column(:reset_password_sent_at).of_type(:datetime) }
    it { should have_db_column(:remember_created_at).of_type(:datetime) }
  end

  describe 'create' do
    it { expect { user.save }.to change(User, :count).by(1) }
  end

  describe 'associations' do
    it { should have_many(:user_tickets) }
    it { should have_many(:draw_winnings).through(:user_tickets) }
  end
end
