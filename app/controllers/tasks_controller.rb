class TasksController < ApplicationController
  def index
    @tasks = Task.all
    # taskテーブルから全てのレコードを取得しtaskのインスタンス変数に代入する
  end

  def new
    @task = Task.new
# @taskはtasksではないけない。一度に作れるのは一つだけ
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to root_path
    else
      render 'new'
    end

  end



  private
    def task_params
      params[:task].permit(:title)
    end
end
