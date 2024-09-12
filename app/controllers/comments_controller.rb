# class CommentsController < ApplicationController
#   def create
#     @comment = Comment.new(comment_params)
#     if @comment.save
#       redirect_to  prototype_path(@comment.prototype.id)
#     else
#       @prototype = @comment.prototype
#       @comments = @prototype.comments
#       render :"prototypes/show", status: :unprocessable_entity
#     end
#   end

#   private
#   def comment_params
#     params.require(:comment).permit(:content).merge(user_id: current_user.id ,prototype_id: params[:prototype_id] )
#   end
# end
class CommentsController < ApplicationController
  def create
    @prototype = Prototype.find(params[:prototype_id])
    @comment = Comment.new(comment_params)
    
    # コメントが空の場合は保存しないで、プロトタイプのshowに戻る
    if @comment.content.blank?
      redirect_to prototype_path(@prototype.id)
    elsif @comment.save
      redirect_to prototype_path(@prototype.id)
    else
      @comments = @prototype.comments
      render :"prototypes/show", status: :unprocessable_entity
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end