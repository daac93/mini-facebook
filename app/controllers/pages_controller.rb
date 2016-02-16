class PagesController < ApplicationController
   
   def homepage
      @post = Post.new
   end
end