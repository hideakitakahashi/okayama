class Member::PostsController < Member::Base
  def index
    @posts = Post.order(:created_at)
    .page(params[:page]) 
  end

  def new
    @member = current_member
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @member = current_member
    if current_member
    @comment = @member.comments.build
    end
    @post =  Post.find(params[:id])
    @comments = @post.comments.order("created_at DESC")
    @posts = Post.order("created_at DESC")
  end

  def create
      @post = current_member.posts.build(post_params)

      if @post.save
        flash.notice = "掲示板に投稿されました。"
        redirect_to :member_root
      else
        flash.notice = '投稿に失敗しました。全て入力してください。'
      redirect_to :member_root
         end
  end



  def destroy
    @post = Post.find(params[:id])
    @post.destroy!
    flash.notice = '投稿を削除しました。'
    redirect_to :member_root
  end

  def select
    @member = current_member
    @category = params[:category]
    @posts = Post.where(category: @category)
    if current_member
    @comment = @member.comments.build(member_id: @member.id)
  end
  end

  private


  def post_params
    params.require(:post).permit(:category, :content, :title)
    end

  

end
