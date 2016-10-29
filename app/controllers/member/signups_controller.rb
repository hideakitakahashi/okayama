class Member::SignupsController < Member::Base
  skip_before_action :authorize, raise: false
  
  def new
    if current_member
      redirect_to :member_root
    else
      @member = Member.new
    end
  end


  def create
    @member = Member.create(member_params)
    if @member.save
      flash.notice = '販売アカウントを新規登録しました。'
      redirect_to :member_root
    else
      render 'new'
    end
  end

  
  private
  def member_params
    params.require(:member).permit(
       :email, :password, :family_name, :given_name, :family_name_kana, :given_name_kana
      )
  end

end
