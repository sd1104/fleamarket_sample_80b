require 'rails_helper'

describe Profile do
  describe '#create' do
    context 'can save' do
      it "is valid with a first_name, last_name, first_name_kana, last_name_kana, birthday" do
        profile = build(:profile)
        expect(profile).to be_valid
      end
      it 'is valid with those:first_name, last_name that are full-size' do
        profile = build(:profile)
        expect(profile).to be_valid
      end
      it 'is valid with those: first_name_kana, last_name_kana that are full-size katakana' do
        profile = build(:profile)
        expect(profile).to be_valid
      end
    end

    context 'can not save' do
      it "is invalid without a first_name" do
        profile = build(:profile, first_name: nil)
        profile.valid?
        expect(profile.errors[:first_name]).to include("を入力してください")
      end
      it "is invalid without a last_name" do
        profile = build(:profile, last_name: nil)
        profile.valid?
        expect(profile.errors[:last_name]).to include("を入力してください")
      end
      it "is invalid without a first_name_kana" do
        profile = build(:profile, first_name_kana: nil)
        profile.valid?
        expect(profile.errors[:first_name_kana]).to include("を入力してください")
      end
      it "is invalid without a last_name_kana" do
        profile = build(:profile, last_name_kana: nil)
        profile.valid?
        expect(profile.errors[:last_name_kana]).to include("を入力してください")
      end
      it "is invalid without a birthday" do
        profile = build(:profile, birthday: nil)
        profile.valid?
        expect(profile.errors[:birthday]).to include("を入力してください")
      end
      it "is invalid first_name is half-size " do
        profile = build(:profile, first_name: "yamada")
        profile.valid?
        expect(profile.errors[:first_name]).to include("は全角で入力してください")
      end
      it "is invalid last_name is half-size" do
        profile = build(:profile, last_name: "taro")
        profile.valid?
        expect(profile.errors[:last_name]).to include("は全角で入力してください")
      end
      it "is invalid first_name_kana is hiragana" do
        profile = build(:profile, first_name_kana: "やまだ")
        profile.valid?
        expect(profile.errors[:first_name_kana]).to include("は全角カタカナで入力してください")
      end
      it "is invalid last_name_kana is hiragana" do
        profile = build(:profile, last_name_kana: "たろう")
        profile.valid?
        expect(profile.errors[:last_name_kana]).to include("は全角カタカナで入力してください")
      end
    end
  end
end