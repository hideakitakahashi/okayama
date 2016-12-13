class StaticPagesController < ApplicationController

  def index
    redirect_to :member_root
  end
end
