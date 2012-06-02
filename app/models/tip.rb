class Tip < ActiveRecord::Base
  attr_accessible :content, :name, :twitter_id, :url

  validates :content, :presence => true, :length => { :maximum => 140 }
  validates :name, :length => { :maximum => 20 }
  validates :twitter_id, :length => { :maximum => 20 }
end
