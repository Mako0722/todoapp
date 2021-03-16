class TasksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def show
    @task = Task.find(params[:id])
    @board = Board.find(params[:board_id])
    @comments = @task.comments.order(id: :desc)
  end

  def new
    board = Board.find(params[:board_id])
    @task = board.tasks.build
  end

  def create
    board = Board.find(params[:board_id])
    @task = board.tasks.build(task_params)
    if @task.save
      redirect_to board_path(board), notice: 'タスクを追加'
    else
      flash.now[:error] = '保存できませんでした'
      render :new
    end
  end

  def edit
    @board = Board.find(params[:board_id])
    @task = current_user.tasks.find(params[:id])
  end

  def update
    @board = Board.find(params[:board_id])
    @task = current_user.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to board_task_path(@board, @task), notice: '更新しました'
      else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  def destroy
    board = Board.find(params[:board_id])
    task = current_user.tasks.find(params[:id])
    task.destroy!
    redirect_to board_path(board), notice: '削除に成功しました'
  end

  private
  def task_params
    params.require(:task).permit(:title, :content, :period, :eyecatch).merge(user_id: current_user.id)
  end
end