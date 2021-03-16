class CommentsController < ApplicationController
  
  def new
    board = Board.find(params[:board_id])
    task = Task.find(params[:task_id])
    @comment = task.comments.build
  end

  def create
    board = Board.find(params[:board_id])
    task = Task.find(params[:task_id])
    @comment = task.comments.build(comment_params)
    if @comment.save
      redirect_to board_task_path(board, task), notice: 'コメントを追加'
    else
      flash.now[:error] = '保存できませんでした'
      render :new
    end
  end

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id)
  end
end