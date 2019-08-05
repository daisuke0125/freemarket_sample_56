require 'rails_helper'
describe User do
  describe '#create' do
    it "is invalid" do
     user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", postcode:"", prefectures:"", city:"", streetNumber:"", number:"", birthday:"",  cordNumber:"",  name_kana:"", name:"")
     user.valid?
     expect(user.errors[:]).to include("can't be blank")
    end
  end
end

# expect(user.errors[:nickname]).to include("can't be blank")