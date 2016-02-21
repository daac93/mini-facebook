class Post < ActiveRecord::Base
    acts_as_votable
    
    belongs_to :user
    
    def self.get_friends_posts(user)
        @friends_posts = get_posts_from(user.friends) 
    end
    
    def self.get_user_posts(user)
        @friends_posts = get_posts_from(user) 
    end
    
    private
    
        def self.get_posts_from(origin)
           @posts =  Post.where(user_id: origin).order(created_at: :desc) 
        end
end
