class Genre < ApplicationRecord
  has_many :items, dependent: :destroy

  enum category: {洋菓子: 0, 和菓子: 1, お肉: 2, お魚: 3, お惣菜:4, 乾物:5, お酒:6, その他:7}
end

