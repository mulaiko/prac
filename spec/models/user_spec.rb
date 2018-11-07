require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    let!(:user_one) { create(:user) }
	  let!(:user_two) { build(:user, email: user_one.email) }

	  it 'is invalid with use of duplicate email' do
	   	user_two.valid?
	   	expect(user_two).to_not be_valid
	  end
		
    it "is invalid without email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")    
    end

    it "is invalid without a name" do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")   
    end

    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")   
    end

    it "is invalid without a password less than 6 characters" do
      user = build(:user, password: "12345")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")   
    end
	end  
end