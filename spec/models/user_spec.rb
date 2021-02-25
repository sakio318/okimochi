# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User,"userモデルに関するテスト", type: :model do
  describe'実際に保存してみる' do
    it "有効な新規登録の場合は保存されるか" do
      expect(FactoryBot.build(:user)).to be_valid
    end
    
    context 'nameカラム' do
      it '2文字以上であること: 1文字は×' do
        user.name = Faker::Lorem.characters(number: 1)
        is_expected.to eq false
      end
      it '2文字以上であること: 2文字は〇' do
        user.name = Faker::Lorem.characters(number: 2)
        is_expected.to eq true
      end
      it '20文字以下であること: 20文字は〇' do
        user.name = Faker::Lorem.characters(number: 15)
        is_expected.to eq true
      end
      it '20文字以下であること: 21文字は×' do
        user.name = Faker::Lorem.characters(number: 16)
        is_expected.to eq false
      end
    end

    context 'introductionカラム' do
      it '50文字以下であること: 50文字は〇' do
        user.introduction = Faker::Lorem.characters(number: 50)
        is_expected.to eq true
      end
      it '50文字以下であること: 51文字は×' do
        user.introduction = Faker::Lorem.characters(number: 51)
        is_expected.to eq false
      end
    end
    end
  end