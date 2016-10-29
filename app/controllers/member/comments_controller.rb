class Member::CommentsController < Member::Base

 

  def edit
    @comment = Comment.find(params[:id])
  end

 
  def create
      @comment = current_member.comments.build(comment_params)

      if @comment.save
        flash.notice = "掲示板に投稿されました。"
        redirect_to :member_root
      else
        flash.notice = '投稿に失敗しました。全て入力してください。'
      redirect_to :member_root
         end
  end



  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy!
    flash.notice = '投稿を削除しました。'
    redirect_to :member_root
  end

  private


  def comment_params
    params.require(:comment).permit(:content, :member_id, :post_id)
    end

end
