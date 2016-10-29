class Member::ShopsController < Member::Base
 def index
    @shop = Shop.order(:id) 
  end


  def new
    @member = current_member
    @shop = Shop.new
  end

  def create
    @shop = current_member.shops.build(shop_params)
    if @shop.save
      flash.notice = 'ショップ情報を登録しました。'
      redirect_to :member_root
    else
      render 'new'
    end
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @member = current_member
    @shop = @member.shop
    @shop.assign_attributes(shop_params)
    if @shop.save
      flash.notice = 'ショップ情報を更新しました。'
      redirect_to :member_account
    else
      render action: 'edit'
    end
  end

 

  private
  def shop_params
    params.require(:shop).permit(
       :name, :category, :url, :email, :phone
      )
  end

end
