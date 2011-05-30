class Comment < ActiveRecord::Base
  belongs_to :user

  # Added delegate
  delegate :city, :country, :to => user

  def commenter_address
    "#{self.city},#{self.country}"
  end

  def self.recent(count)
    order("created_at DESC").limit(count)
  end

  def is_minimum_length?
    self.text.size < 4 ? false : true
  end

  def to_s
    "#{comment.user.login}::#{comment.commenter_address}"
  end
end

