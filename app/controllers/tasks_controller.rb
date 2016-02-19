class TasksController < ApplicationController
  before_filter :set_board, only: [:new, :create, :edit, :update, :destroy]
  before_filter :set_task, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @task = @board.tasks.new
  end

  def create
    @task = @board.tasks.new(task_params)
    if @task.save
      redirect_to @board, notice: 'Task was succesfully creates.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to @board, notice: 'Task was succesfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to @board, notice: 'Board was succesfully destroyed.'
  end

  private

  def set_board
    @board = Board.find(params[:board_id])
  end

  def set_task
    @task = Board.find(params[:board_id]).tasks.find(params[:id])
  end


  def task_params
    params.require(:task).permit(:title, :task_start, :task_finish)
  end

end
