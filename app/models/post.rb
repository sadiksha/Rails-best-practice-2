class Post < ActiveRecord::Base
 has_many :comments
belongs_to :user

 def to_param
   "#{id}-{self.title}"
 end

 def to_s
   "#{post.title} (#{post.comments.size})"
 end

end

