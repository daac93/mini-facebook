class PagesController < ApplicationController
   
   def homepage
      @post = Post.new
      @friends_posts = Post.get_friends_posts(current_user)
   end
   
end