class Admin::ShopsController < Admin::Base
  def index
    @shop = Shop.order(:id) 
  end
  
  def show
      @shop = Shop.find(params[:id])
  end


  def new
    @member = Member.find(params[:member_id])
    @shop = Shop.new
  end

  def create
    @member = Member.find(params[:id])
    @shop = @member.shops.build(shop_params)
    if @shop.save
      flash.notice = 'ショップ情報を登録しました。'
      redirect_to :admin_root
    else
      render 'new'
    end
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    @shop = @member.shop
    @shop.assign_attributes(shop_params)
    if @shop.save
      flash.notice = 'ショップ情報を更新しました。'
      redirect_to :admin_root
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
