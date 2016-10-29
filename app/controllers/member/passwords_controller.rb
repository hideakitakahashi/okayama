class Member::PasswordsController < Member::Base
  def show
    redirect_to :edit_member_password
  end

  def edit
    @change_password_form = 
    Member::ChangePasswordForm.new(object: current_member)
  end
end
