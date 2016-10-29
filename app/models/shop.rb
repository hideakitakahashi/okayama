class Shop < ApplicationRecord
  belongs_to :member

  CATEGORY_NAMES = %w( 農産畜産品 加工食品(味噌、海産物など) パン、お菓子 日用雑貨 売店食堂 工房、アート、おもちゃ 遊ぶ イベント紹介 メンタルケア 移住、田畑の相談 グループ紹介 アースシップを造りたい あげます欲しいですコーナー その他 )

end
