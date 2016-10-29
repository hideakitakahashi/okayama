class Admin::Base < ApplicationController
  private
  def current_admin
    if session[:admin_id]
      @current_admin ||= Admin.find_by(id: session[:admin_id])
    end
  end

  helper_method :current_admin

  def authorize
    unless current_admin
      flash.alert = '管理者としてログインしてください。'
      redirect_to :admin_login
    end
  end

end
