class Admin::InfoController < Admin::Base
    
    def edit
        @info = Info.find(params[:id])
    end
    
    def update
        @info = Info.find(params[:id])
        @info.assign_attributes(info_params)
        if @info.save
            flash.notice = 'サイト情報を更新しました。'
            redirect_to :admin_root
            else
            render action: 'edit'
        end
    end
    
    def new
        @info = Info.new
    end
    
    
    def create
        @info = Info.create(info_params)
        if @info.save
            flash.notice = 'サイト情報を新規登録しました。'
            redirect_to :admin_root
            else
            render 'new'
        end
    end
    
    def destroy
        @info = Info.find(params[:id])
        @info.destroy!
        flash.notice = 'サイト情報を削除しました。'
        redirect_to :admin_root
    end
    
    private
    def info_params
        params.require(:info).permit(:howto, :why, :vision)
    end

end
