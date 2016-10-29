class Admin::TopController < Admin::Base
   before_action :authorize, raise: false
  def index
  @members = Member.all
  end
  
end
