class TasksController < ApplicationController
 
  def new
    article = Article.find(params[:article_id])
    @task  = article.tasks.build
  end
end