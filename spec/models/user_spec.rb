# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User,"userモデルに関するテスト", type: :model do
  describe'実際に保存してみる' do
    it "有効な新規登録の場合は保存されるか" do
      expect(FactoryBot.build(:user)).to be_valid
    end
  end
  describe'バリデーションのテスト' do
    it
end