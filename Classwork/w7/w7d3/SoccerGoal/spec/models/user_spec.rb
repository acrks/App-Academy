require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  #Validations

  it {should validate_presence_of(:username)}
  it {should validate_presence_of(:password_digest)}
  it {should validate_length_of(:password).is_at_least(6)}

  subject(:capy) { FactoryBot.create(:user) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_presence_of(:session_token) }

  #Associations

  it {should have_many(:goals)}

  #Methods

  describe 'password_encryption' do 
    it 'does not save passwords to our db' do
      FactoryBot.create(:user, username: 'username2')
      user = User.find_by(username: 'username2')
      expect(user.password).not_to eq('password')
      expect(user.password_digest).not_to eq('password')
    end

    it 'encrypts our password with BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('abcdef')

      FactoryBot.build(:user, password: 'abcdef')
    end
  end

  describe 'identify_user' do
    it 'should find User given credentials' do
      FactoryBot.create(:user, username: 'username3', password: 'password')
      user3 = User.find_by_credentials('username3', 'password')
      expect(user3).not_to eq(nil)
    end
  end

end


