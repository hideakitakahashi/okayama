class Admin::MembersController < Admin::Base

def index
  @members = Member.all
  
end

 def show
    @member = Member.find(params[:id])
    @posts = @member.posts.paginate(page: params[:page])
    @shop = @member.shops.all
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    @member.assign_attributes(member_params)
    if @member.save
      flash.notice = 'メンバー情報を更新しました。'
      redirect_to :member_account
    else
      render action: 'edit'
    end
  end

  def new
      @member = Member.new
  end


  def create
    @member = Member.create(new_member_params)
    if @member.save
      flash.notice = 'メンバーを新規登録しました。'
      redirect_to :admin_root
    else
      render 'new'
    end
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy!
    flash.notice = 'メンバーを削除しました。'
    redirect_to :admin_root
  end

  private
  def member_params
    params.require(:member).permit(:email, :family_name, :given_name, :family_name_kana, :given_name_kana, :image
      )
  end

  def new_member_params
    params.require(:member).permit(:email, :password, :family_name, :given_name, :family_name_kana, :given_name_kana
      )
  end


end
