class Member::TopController < Member::Base

  skip_before_action :authorize, raise: false

  def index
  if current_member
    @member = current_member
    @post = @member.posts.build
    @posts = Post.order(created_at: :desc)
    @members = Member.order(:family_name_kana)
    @comment = @member.comments.build(member_id: @member.id)
    render action: 'index'
  else
    @posts = Post.order(created_at: :desc)
    @members = Member.order(:family_name_kana)

    render action: 'index'
  end
end

 def vege
    @vegetable = Shop.where(category: '農産畜産品')
end

 def prod
    @prod = Shop.where(category: '加工食品(味噌、海産物など)')
end

 def sweets
    @sweets = Shop.where(category: 'パン、お菓子')
  end

 def goods
    @goods = Shop.where(category: '日用雑貨')
end
 def shop
    @shop = Shop.where(category: '売店食堂')
end
 def art
    @art = Shop.where(category: '工房、アート、おもちゃ')
end
 def play
    @play = Shop.where(category: '遊ぶ')
end
 def event
    @event = Shop.where(category: 'イベント紹介')
end
 def care
    @care = Shop.where(category: 'メンタルケア')
end

 def move
    @move = Shop.where(category: '移住、田畑の相談')
end

def group
    @group = Shop.where(category: '農グループ紹介')
end

def ship
    @ship = Shop.where(category: 'アースシップを造りたい')
end

def give
    @give = Shop.where(category: 'あげます欲しいですコーナー')
end

def etc
    @etc = Shop.where(category: 'その他')
end

  



end
