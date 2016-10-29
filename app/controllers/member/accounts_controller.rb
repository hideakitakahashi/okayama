class Member::AccountsController < Member::Base
  def show
    @member = current_member
    @posts = @member.posts.paginate(page: params[:page])
    @shop = @member.shops.all
  end

  def edit
    @member = current_member
  end

  def update
    @member = current_member
    @member.assign_attributes(member_params)
    if @member.save
      flash.notice = 'メンバー情報を更新しました。'
      redirect_to :member_account
    else
      render action: 'edit'
    end
  end

  private
  def member_params
    params.require(:member).permit(:email, :family_name, :given_name, :family_name_kana, :given_name_kana, :image
      )
  end

end
