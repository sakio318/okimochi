# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Item,"itemモデルに関するテスト", type: :model do
  genre = FactoryBot.create(:genre)
  user = FactoryBot.create(:user)
  describe'実際に保存してみる' do
    it "有効な新規登録の場合は保存されるか" do
       expect{FactoryBot.build(:item, :genre => genre, :user => user).to be_valid }
    end
  end

  describe 'nameカラム' do
    it '空欄でないこと: 空欄は×' do
      expect(FactoryBot.build(:item, name: "")).to be_invalid
    end
    it '255文字以下であること: 255文字は〇' do
      expect(FactoryBot.build(:item,:genre => genre, :user => user, name: "a"*255)).to be_valid
    end
    it '255文字以下であること: 256文字は×' do
      expect(FactoryBot.build(:item, name: "a"*256)).to be_invalid
    end
  end

  describe 'shop_nameカラム' do
    it '空欄でないこと: 空欄は×' do
      expect(FactoryBot.build(:item, shop_name: "")).to be_invalid
    end
    it '255文字以下であること: 255文字は〇' do
      expect(FactoryBot.build(:item,:genre => genre, :user => user, shop_name: "a"*255)).to be_valid
    end
    it '255文字以下であること: 256文字は×' do
      expect(FactoryBot.build(:item, shop_name: "a"*256)).to be_invalid
    end
  end

  describe 'packingカラム' do
    it '空欄でないこと: 空欄は×' do
      expect(FactoryBot.build(:item, packing: "")).to be_invalid
    end
  end

  describe 'introductionカラム' do
    it '255文字以下であること: 255文字は〇' do
      expect(FactoryBot.build(:item,:genre => genre, :user => user, introduction: "a"*255)).to be_valid
    end
    it '255文字以下であること: 256文字は×' do
      expect(FactoryBot.build(:item, introduction: "a"*256)).to be_invalid
    end
  end

  describe 'genre_idカラム' do
    it '空欄でないこと: 空欄は×' do
       expect(FactoryBot.build(:item, genre_id: nil)).to be_invalid
    end
  end


  end