class Site < ActiveRecord::Base
  has_many :polls

  def latest_poll
    polls.last || Poll.new
  end
end
