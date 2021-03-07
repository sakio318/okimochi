# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Favorites,"favoriteモデルに関するテスト", type: :model do
  item = FactoryBot.create(:item)
  user = FactoryBot.create(:user)
  describe'いいねをクリックする' do
    it "いいねできる" do
       expect(page).have_css''
    end
    it 'いいねが取り消せる' do
      expect(FactoryBot.build(:item, name: "")).to be_invalid
    end
  end

  end