require 'rails_helper'

describe Item do
  describe '#create' do


    context 'can save' do
      
      it 'is valid with name' do
        @item = build(:item)
        expect(@item).to be_valid
      end

      # it 'is valid with introduction' do
      #   expect(build(:item)).to be_valid
      # end
    end



    context 'can not save' do

      it 'is invalid without name' do
        item = build(:item, name: nil)
        item.valid?
        expect(item.errors[:name]).to include("を入力してください")
      end
      
    end


  end
end