require 'rails_helper'
describe User do
  describe '#create' do

    it 'is valid with all of columns' do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a nickname" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "is invalid without a emai" do
      user = build(:user, email:nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without a password" do
      user = build(:user, password:nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "is invalid without a password_confirmation" do
      user = build(:user, password_confirmation:"")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "is invalid without a postcode" do
      user = build(:user, postcode:nil)
      user.valid?
      expect(user.errors[:postcode]).to include("can't be blank")
    end

    it "is invalid without a prefectures" do
      user = build(:user, prefectures:nil)
      user.valid?
      expect(user.errors[:prefectures]).to include("can't be blank")
    end

    it "is invalid without a city" do
      user = build(:user, city:nil)
      user.valid?
      expect(user.errors[:city]).to include("can't be blank")
    end

    it "is invalid without a streetNumber" do
      user = build(:user, streetNumber:nil)
      user.valid?
      expect(user.errors[:streetNumber]).to include("can't be blank")
    end

    it "is invalid without a number" do
      user = build(:user, number:nil)
      user.valid?
      expect(user.errors[:number]).to include("can't be blank")
    end

    it "is invalid without a birth_year" do
      user = build(:user, birth_year:nil)
      user.valid?
      expect(user.errors[:birth_year]).to include("can't be blank")
    end

    it "is invalid without a birth_month" do
      user = build(:user, birth_month:nil)
      user.valid?
      expect(user.errors[:birth_month]).to include("can't be blank")
    end

    it "is invalid without a birth_day" do
      user = build(:user, birth_day:nil)
      user.valid?
      expect(user.errors[:birth_day]).to include("can't be blank")
    end

    it "is invalid without a cordNumber" do
      user = build(:user, cordNumber:nil)
      user.valid?
      expect(user.errors[:cordNumber]).to include("can't be blank")
    end

    it "is invalid without a first_name_kana" do
      user = build(:user, first_name_kana:nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end

    it "is invalid without a first_name" do
      user = build(:user, first_name:nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    it "is invalid without a last_name_kana" do
      user = build(:user, last_name_kana:nil)
      user.valid?
      expect(user.errors[:last_name_kana]).to include("can't be blank")
    end

    it "is invalid without a last_name" do
      user = build(:user, last_name:nil)
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "is invalid with a duplicate nickname" do
      user = create(:user)
      another_user = build(:user, nickname: user.nickname)
      another_user.valid?
      expect(another_user.errors[:nickname]).to include("has already been taken")
    end

    it "is invalid with a duplicate number" do
      user = create(:user)
      another_user = build(:user, number: user.number)
      another_user.valid?
      expect(another_user.errors[:number]).to include("has already been taken")
    end

    it "is invalid with a duplicate cordNumber" do
      user = create(:user)
      another_user = build(:user, cordNumber: user.cordNumber)
      another_user.valid?
      expect(another_user.errors[:cordNumber]).to include("has already been taken")
    end

    it "is invalid with a password that has less than 7 characters " do
      user = build(:user, password: "aaaaaa")
      user.valid?
      expect(user.errors[:password][0]).to include("is too short")
    end

    it "is invalid with a password that has more than 15 characters " do
      user = build(:user, password: "aaaaaaaaaaaaaaaa")
      user.valid?
      expect(user.errors[:password][0]).to include("is too long")
    end

    it "is invalid with a number that has less than 10 characters " do
      user = build(:user, number: "aaaaaaaaa")
      user.valid?
      expect(user.errors[:number][0]).to include("is too short")
    end

    it "is invalid with a number that has less than 10 characters " do
      user = build(:user, number: "aaaaaaaaa")
      user.valid?
      expect(user.errors[:number][0]).to include("is too short")
    end

  end
end
