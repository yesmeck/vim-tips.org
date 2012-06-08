class TipsController < ApplicationController
  # GET /
  def index
    if params[:page].nil?
      params[:page] = 1
    end
    @tips = Tip.where(:approved => true).order('created_at DESC').paginate(:page => params[:page], :per_page=> 15)
  end

  # GET /tips/1
  def show
    @tip = Tip.where('approved = ?', true).find(params[:id])
    if @tip.nil?
      raise ActionController::RoutingError.new('Not Found')
    end
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
      redirect_to '/', notice: 'Thanks you for sharing, please wait for admin approval'
    else
      render action: "new"
    end
  end

  # GET /tips/random
  def random
    rand_id = rand(Tip.count);
    @tip = Tip.first(:conditions => ['id >= ? AND approved = ?', rand_id, true])
    if !@tip.nil?
      render :text => @tip.content
    else
      render :text => 'No tips.'
    end
  end

end
