class Post < ApplicationRecord
  belongs_to :member
  has_many :comments
  default_scope -> { order(created_at: :desc) }
  validates :member_id, presence: true
  CATEGORY_NAMES = %w( 農産畜産品 加工食品(味噌、海産物など) パン、お菓子 売店食堂 雑貨、工房、アート、おもちゃ イベント紹介 メンタルケア 移住、田畑の相談 グループ紹介 その他・雑談 あげます欲しいですコーナー )
end
