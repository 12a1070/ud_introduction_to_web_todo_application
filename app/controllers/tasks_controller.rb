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

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task =Task.find(params[:id])
    if @task.update(task_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private
    def task_params
# セキュリティ対策でtask_params経由でデータをモデルにセット
      params[:task].permit(:title)
      # paramsにはtask項目から入ったデータが送られてくる。フォームから送信されてきたもののうちタイトルカラムのみデータベースに格納
    end
end
