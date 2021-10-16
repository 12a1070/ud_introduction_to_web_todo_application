class TasksController < ApplicationController
  def index
    @tasks = Task.all
    # taskテーブルから全てのレコードを取得しtaskのインスタンス変数に代入する
  end
end
