class Member::MembersController < Member::Base
  def show
    @show_member = Member.find(params[:member_id])
    @member = current_member
  end

  def shop
    @shop = Shop.find(params[:id])
    @member = current_member
  end
end
