require 'rails_helper'

describe Item do
  describe '#create' do


    context 'can save' do
      
      it 'is valid with all: name, introduction, price, condition_id, delivery_charge_id, delivery_origin_id, delivery_date_id, brand, category, seller' do
        expect(build(:item)).to be_valid
      end

      it 'is valid with name, introduction, price, condition_id, delivery_charge_id, delivery_origin_id, delivery_date_id, category, seller' do
        expect(build(:item, brand: nil)).to be_valid
      end

      it 'is valid for 40 characters or less' do
        expect(build(:item, name: ("a" * 40))).to be_valid
      end

      it 'is valid for 1000 characters or less' do
        expect(create(:item, introduction: ("a" * 1000))).to be_valid
      end
      
    end



    context 'can not save' do

      it 'is invalid without seller' do
        item = build(:item, seller: nil)
        item.valid?
        expect(item.errors[:seller]).to include("を入力してください")
      end

      it 'is invalid without name' do
        item = build(:item, name: nil)
        item.valid?
        expect(item.errors[:name]).to include("を入力してください")
      end

      it 'is invalid after 40 characters' do
        item = build(:item, name: ("a") * 41)
        item.valid?
        expect(item.errors[:name]).to include("は40文字以内で入力してください")
      end

      it 'is invalid without introduction' do
        item = build(:item, introduction: nil)
        item.valid?
        expect(item.errors[:introduction]).to include("を入力してください")
      end

      it 'is invalid after 1000 characters' do
        item = build(:item, introduction: ("a") * 1001)
        item.valid?
        expect(item.errors[:introduction]).to include("は1000文字以内で入力してください")
      end

      it 'is invalid without category' do
        item = build(:item, category: nil)
        item.valid?
        expect(item.errors[:category]).to include("を入力してください")
      end

      it 'is invalid without condition_id' do
        item = build(:item, condition_id: nil)
        item.valid?
        expect(item.errors[:condition_id]).to include("を選択してください")
      end

      it 'is invalid without delivery_charge_id' do
        item = build(:item, delivery_charge: nil)
        item.valid?
        expect(item.errors[:delivery_charge_id]).to include("を選択してください")
      end

      it 'is invalid without delivery_origin_id' do
        item = build(:item, delivery_origin_id: nil)
        item.valid?
        expect(item.errors[:delivery_origin_id]).to include("を選択してください")
      end

      it 'is invalid without delivery_date_id' do
        item = build(:item, delivery_date_id: nil)
        item.valid?
        expect(item.errors[:delivery_date_id]).to include("を選択してください")
      end

      it 'is invalid without price' do
        item = build(:item, price: nil)
        item.valid?
        expect(item.errors[:price]).to include("を入力してください")
      end

      it 'is invalid without item_images' do
        item = build(:no_item_images)
        item.valid?
        expect(item.errors[:item_images]).to include("を選択してください")
      end

    end


  end
end