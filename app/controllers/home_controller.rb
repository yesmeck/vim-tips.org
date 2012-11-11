class HomeController < ApplicationController
  def index
    @tip = Tip.random
    render 'tips/show'
  end
  def plugin

  end

  def about

  end
end
