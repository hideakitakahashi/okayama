class Admin::SessionsController < Admin::Base
  skip_before_action :authorize, raise: false

  def new
    if current_admin
      redirect_to :admin_root
    else
      @form = Admin::LoginForm.new
      render action: 'new'
    end
  end

  def create
    @form = Admin::LoginForm.new(admin_login_form_params)
    if @form.email.present?
      admin = Admin.find_by(email_for_index: @form.email.downcase)
    end
    if Admin::Authenticator.new(admin).authenticate(@form.password)
      session[:admin_id] = admin.id
      flash.notice = 'ログインしました。'
      redirect_to :admin_root
    else
      flash.now.alert = 'メールアドレスまたはパスワードが正しくありません。'
      render action: 'new'
    end
  end

  def destroy
    session.delete(:admin_id)
    flash.notice = 'ログアウトしました。'
    redirect_to :admin_root
  end

private
def admin_login_form_params
 params.require(:admin_login_form).permit(:email,:password)
end



end
