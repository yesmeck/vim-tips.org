class TipsController < ApplicationController
  # GET /
  def index
    @tips = Tip.all
  end

  # GET /tips/1
  def show
    @tip = Tip.find(params[:id])
  end

  # GET /tips/new
  def new
    @tip = Tip.new
  end

  # POST /tips
  # POST /tips.json
  def create
    @tip = Tip.new(params[:tip])

    if @tip.save
      redirect_to @tip, notice: 'Tip was successfully created.'
    else
      render action: "new"
    end
  end

  # GET /tips/random
  def random
    rand_id = rand(Tip.count);
    @tip = Tip.first(:conditions => ['id >= ?', rand_id]);
    render :text => @tip.content
  end

end
