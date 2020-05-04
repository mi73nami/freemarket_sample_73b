require 'rails_helper'

describe Product do

  describe '#create' do

    context 'productを保存できる場合' do

      it "nameがない場合は登録できないこと" do
        product = build(:product, name: nil)
        product.valid?
        expect(product.errors[:name]).to include("can't be blank")
      end

      it "detailがない場合は登録できないこと" do
        product = build(:product, detail: nil)
        product.valid?
        expect(product.errors[:detail]).to include("can't be blank")
      end

      it "conditionがない場合は登録できないこと" do
        product = build(:product, condition: nil)
        product.valid?
        expect(product.errors[:condition]).to include("can't be blank")
      end
      
      it "delivery_feeがない場合は登録できないこと" do
        product = build(:product, delivery_fee: nil)
        product.valid?
        expect(product.errors[:delivery_fee]).to include("can't be blank")
      end

      it "shipping_areaがない場合は登録できないこと" do
        product = build(:product, shipping_area: nil)
        product.valid?
        expect(product.errors[:shipping_area]).to include("can't be blank")
      end

      it "shipping_daysがない場合は登録できないこと" do
        product = build(:product, shipping_days: nil)
        product.valid?
        expect(product.errors[:shipping_days]).to include("can't be blank")
      end

      it "priceがない場合は登録できないこと" do
        product = build(:product, price: nil)
        product.valid?
        expect(product.errors[:price]).to include("can't be blank")
      end

      it "category_idがない場合は登録できないこと" do
        product = build(:product, category_id: nil)
        product.valid?
        expect(product.errors[:category_id]).to include("can't be blank")
      end

      it "user_idがない場合は登録できないこと" do
        product = build(:product, user_id: nil)
        product.valid?
        expect(product.errors[:user_id]).to include("can't be blank")
      end
      
      it "全て揃っている時保存できる" do
        product = build(:product)
        expect(product).to be_valid
      end

    end

  end

end