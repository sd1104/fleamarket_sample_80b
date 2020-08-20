require 'rails_helper'
describe ProductAddress do
  describe '#create' do

    context 'can save' do

      it 'is valid with all: first_name, last_name, first_name_kana, last_name_kana, postal_code, prefecture_code, address_city and address_street, building_name, phone_number' do
        expect(build(:product_address)).to be_valid
      end

      it 'is valid with first_name, last_name, first_name_kana, last_name_kana, postal_code, prefecture_code, address_city and address_street' do
        expect(build(:product_address, building_name: nil, phone_number: nil)).to be_valid
      end

      it 'is valid with each of those:first_name, last_name that are two-byte character' do
        expect(build(:product_address)).to be_valid
      end

      it 'is valid with each of those: first_name_kana, last_name_kana that are two-byte character and katakana' do
        expect(build(:product_address)).to be_valid
      end

      it 'is valid with postal_code that has 7 numbers' do
        expect(build(:product_address)).to be_valid
      end

      it 'is valid with postal_code that has 7 numbers' do
        expect(build(:product_address)).to be_valid
      end

      it 'is valid with phone_number that has 10 or 11 numbers' do
        expect(build(:product_address)).to be_valid
      end

      before do
        @product1 = build(:product_address)
        @product2 = build(:product_address)
      end
      it 'returns true with uniqueness validation' do
        @product1.phone_number =  @product2.phone_number
        expect(@product1.valid?).to eq(true)
      end 

    end

    context 'can not save' do

      it 'is invalid without first_name' do
        product_address = build(:product_address, first_name: nil)
        product_address.valid?
        expect(product_address.errors[:first_name]).to include("を入力してください")
      end

      it 'is invalid without last_name' do
        product_address = build(:product_address, last_name: nil)
        product_address.valid?
        expect(product_address.errors[:last_name]).to include("を入力してください")
      end

      it 'is invalid without first_name_kana' do
        product_address = build(:product_address, first_name_kana: nil)
        product_address.valid?
        expect(product_address.errors[:first_name_kana]).to include("を入力してください")
      end

      it 'is invalid without last_name_kana' do
        product_address = build(:product_address, last_name_kana: nil)
        product_address.valid?
        expect(product_address.errors[:last_name_kana]).to include("を入力してください")
      end

      it 'is invalid without postal_code' do
        product_address = build(:product_address, postal_code: nil)
        product_address.valid?
        expect(product_address.errors[:postal_code]).to include("を入力してください")
      end

      it 'is invalid without prefecture_code' do
        product_address = build(:product_address, prefecture_code: nil)
        product_address.valid?
        expect(product_address.errors[:prefecture_code]).to include("を入力してください")
      end

      it 'is invalid without address_city' do
        product_address = build(:product_address, address_city: nil)
        product_address.valid?
        expect(product_address.errors[:address_city]).to include("を入力してください")
      end

      it 'is invalid without address_street' do
        product_address = build(:product_address, address_street: nil)
        product_address.valid?
        expect(product_address.errors[:address_street]).to include("を入力してください")
      end

      it 'is invalid when first_name is not 2byte-character' do
        product_address = build(:product_address, first_name: "yamada")
        product_address.valid?
        expect(product_address.errors[:first_name]).to include("は全角で入力してください")
      end

      it 'is invalid last_name is not 2byte-character' do
        product_address = build(:product_address, last_name: "taro")
        product_address.valid?
        expect(product_address.errors[:last_name]).to include("は全角で入力してください")
      end

      it 'is invalid first_name is not 2byte-character and katakana' do
        product_address = build(:product_address, first_name_kana: "やまだ")
        product_address.valid?
        expect(product_address.errors[:first_name_kana]).to include("は全角カタカナで入力してください")
      end

      it 'is invalid first_name is not 2byte-character and katakana' do
        product_address = build(:product_address, last_name_kana: "たろう")
        product_address.valid?
        expect(product_address.errors[:last_name_kana]).to include("は全角カタカナで入力してください")
      end

      it "is invalid with a postal_code that has less than 6 numbers " do
        product_address = build(:product_address, postal_code: "000000")
        product_address.valid?
        expect(product_address.errors[:postal_code]).to include("はハイフンなし、半角数字のみの７桁で入力してください")
      end

      it "is invalid with a postal_code that has more than 8 numbers " do
        product_address = build(:product_address, postal_code: "00000000")
        product_address.valid?
        expect(product_address.errors[:postal_code]).to include("はハイフンなし、半角数字のみの７桁で入力してください")
      end

      it "is invalid with a phone_number that has less than 9 numbers " do
        product_address = build(:product_address, phone_number: "000000000")
        product_address.valid?
        expect(product_address.errors[:phone_number]).to include("はハイフンなし、半角数字で入力してください")
      end

      it "is invalid with a phone_number that has more than 12 numbers " do
        product_address = build(:product_address, phone_number: "000000000000")
        product_address.valid?
        expect(product_address.errors[:phone_number]).to include("はハイフンなし、半角数字で入力してください")
      end

      before do
        create(:product_address, phone_number: '09012345678')
        @product_address = build(:product_address, phone_number: '09012345678')
      end
      it 'returns false with uniqueness validation' do
        expect(@product_address.save).to be_falsey
      end
    
    end
    
  end
end