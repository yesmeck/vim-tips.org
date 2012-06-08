class HomeController < ApplicationController
  def plugin

  end

  def about

  end

  def random
    rand_id = rand(Tip.count);
    @tip = Tip.first(:conditions => ['id >= ? AND approved = ?', rand_id, true])

    render 'tips/show'
  end
end
