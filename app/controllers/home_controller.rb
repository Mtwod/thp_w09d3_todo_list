class HomeController < ApplicationController
  def index
    @tasks = Task.all
    @categories = Category.all
    @task = Task.new()
  end
end
