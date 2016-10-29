class Admin::SignupsController < Admin::Base
  skip_before_action :authorize, raise: false
  
  def new
    if current_admin
      redirect_to :admin_root
    else
      @admin = Admin.new
    end
  end


  def create
    @admin = Admin.create(admin_params)
    if @admin.save
      flash.notice = '新しい管理者を登録しました。'
      redirect_to :admin_root
    else
      render 'new'
    end
  end

  
  private
  def admin_params
    params.require(:admin).permit(
       :email, :password, :admin_name
      )
  end

end
