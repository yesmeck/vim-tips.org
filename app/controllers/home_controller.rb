class HomeController < ApplicationController

  # GET /
  def index
    @tips = Tip.all
  end

end
