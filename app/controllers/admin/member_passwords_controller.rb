class Admin::MemberPasswordsController < Admin::Base
  def show
    redirect_to :edit_admin_member_member_password
  end

  def edit
    member = Member.find(params[:member_id])
    @change_member_password_form = Admin::ChangeMemberPasswordForm.new(object: member)
  end
end
