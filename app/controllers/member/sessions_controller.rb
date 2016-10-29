class Member::SessionsController < Member::Base
  skip_before_action :authorize, raise: false

  def new
    if current_member
      redirect_to :member_root
    else
      @form = Member::LoginForm.new
      render action: 'new'
    end
  end

  def create
    @form = Member::LoginForm.new(member_login_form_params)
    if @form.email.present?
      member = Member.find_by(email_for_index: @form.email.downcase)
    end
    if Member::Authenticator.new(member).authenticate(@form.password)
      session[:member_id] = member.id
      flash.notice = 'ログインしました。'
      redirect_to :member_root
    else
      flash.now.alert = 'メールアドレスまたはパスワードが正しくありません。'
      render action: 'new'
    end
  end

  def destroy
    session.delete(:member_id)
    flash.notice = 'ログアウトしました。'
    redirect_to :member_root
  end

private
def member_login_form_params
 params.require(:member_login_form).permit(:email,:password)
end



end
