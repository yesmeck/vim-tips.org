class TipsController < ApplicationController
  # GET /
  def index
    if params[:page].nil?
      params[:page] = 1
    end
    @tips = Tip.where(:approved => true).order('created_at DESC')
               .paginate(:page => params[:page], :per_page=> 10)
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

      AdminMailer.notice_email(@tip).deliver

      redirect_to '/', notice: 'Thanks you for sharing, please wait for admin approval'
    else
      render action: "new"
    end
  end

  # GET /tips/random
  def random
    @tip = Tip.random
    if !@tip.nil?
      render :text => @tip.content
    else
      render :text => 'No tips.'
    end
  end

  def feed
    @title = 'Vim Tips'

    @tips = Tip.where(:approved => true).order('created_at DESC')

    @updated = @tips.first.updated_at if !@tips.empty?

    respond_to do |format|
      format.atom { render :layout => false, :content_type => 'application/xml' }
      format.rss { redirect_to feed_path(:format => :atom), :status => :moved_permanently }
    end
  end

end
