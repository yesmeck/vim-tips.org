class Tip < ActiveRecord::Base
  attr_accessible :content, :name, :twitter_id, :url, :approved

  validates :content, :presence => true, :length => { :maximum => 140 }
  validates :name, :length => { :maximum => 20 }
  validates :twitter_id, :length => { :maximum => 20 }

  def self.random
    rand_id = rand(Tip.where('approved = ?', true).count);
    Tip.first(:conditions => ['id >= ? AND approved = ?', rand_id, true])
  end
end
