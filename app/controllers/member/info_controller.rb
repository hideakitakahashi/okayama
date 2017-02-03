class Member::InfoController < Member::Base
    
    def index
        @info = Info.all
    end
    
    def show
        @info = Info.find(params[:id])
        if params[:name] == 'howto'
            render :action => "howto"
        elseif params[:name] == 'why'
            render :action => "why"
        else params[:name] == 'vision'
            render :action => "vision"
        end
    end
    
    def howto
        @info = Info.find(params[:id])
    end
    
    def why
        @info = Info.find(params[:id])
    end
    
    def vision
        @info = Info.find(params[:id])
    end
    
    
  end
