class Member::Base < ApplicationController
  
  private
  def current_member
    if session[:member_id]
      @current_member ||= Member.find_by(id: session[:member_id])
    end
  end

  helper_method :current_member

  def authorize
    unless current_member
      flash.alert = 'メンバーとしてログインしてください。'
      redirect_to :member_login
    end
  end

end
