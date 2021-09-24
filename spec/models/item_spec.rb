require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報入力' do
    context '商品情報入力がうまくいく時' do
      it '全ての値が正しく入力されていれば出品できること' do
        expect(@item).to be_valid
      end
    end

    context '商品情報の入力がうまく行かない時' do
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"

      end
      it 'nameが空だと出品できない' do
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end

      it 'descriptionが空だと出品できない' do
        @item.item_description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Item description can't be blank"
      end

      it 'categoryが未選択だと出品できない' do
        @item.item_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Item category can't be blank"
      end

      it 'stateが未選択だと出品できない' do
        @item.item_state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Item state can't be blank"
      end

      it 'shipping_costが未選択だと出品できない' do
        @item.shipping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping cost can't be blank"
      end

      it 'prefectureが未選択だと出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end

      it 'shipping_dayが未選択だと出品できない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping day can't be blank"
      end

      it 'priceが空だと出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it 'priceが全角数字だと出品できない' do
        @item.price = "２０００"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price Out of setting range", "Price Half-width number."
      end
    end
  end
end