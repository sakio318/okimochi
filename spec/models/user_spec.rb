# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User,"userモデルに関するテスト", type: :model do
  describe'実際に保存してみる' do
    it "有効な新規登録の場合は保存されるか" do
      expect(FactoryBot.build(:user)).to be_valid
    end
  end

  describe 'nameカラム' do
    it '2文字以上であること: 1文字は×' do
        expect(FactoryBot.build(:user, name: "a")).to be_invalid
    end
    it '2文字以上であること: 2文字は〇' do
        expect(FactoryBot.build(:user, name: "ab")).to be_valid
    end
    it '20文字以下であること: 15文字は〇' do
        expect(FactoryBot.build(:user, name: "1"*15)).to be_valid
    end
    it '20文字以下であること: 16文字は×' do
        expect(FactoryBot.build(:user, name: "1"*16)).to be_invalid
    end
  end
  
  describe 'emailカラム' do
    it '空欄でないこと: 空欄は×' do
       expect(FactoryBot.build(:user, email: "")).to be_invalid
    end
    it '255文字以下であること: 255文字は〇' do
       expect(FactoryBot.build(:user, email: "a"*250+"@"+"a"*4)).to be_valid
    end
    it '255文字以下であること: 256文字は×' do
         expect(FactoryBot.build(:user, email: "a"*250+"@"+"a"*5)).to be_invalid
    end
  end
  
  describe 'passwordカラム' do
    it '空欄でないこと: 空欄は×' do
       expect(FactoryBot.build(:user, password: "")).to be_invalid
    end
  end

  describe 'introductionカラム' do
    it '50文字以下であること: 50文字は〇' do
       expect(FactoryBot.build(:user, introduction: "a"*50)).to be_valid
    end
    it '50文字以下であること: 51文字は×' do
         expect(FactoryBot.build(:user, introduction: "a"*51)).to be_invalid
    end
  end

  end