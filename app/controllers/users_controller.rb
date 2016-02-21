class UsersController < ApplicationController
    before_action :set_friend, except: [:friends, :friend_requests, :search, :index]
    
    def friends
        @friends = current_user.friends.paginate(page: params[:page], per_page: 20)
    end
    
    def index 
        @users = User.where.not(id: current_user.friends, id: current_user.id)
    end
    
    def search
      @users_result = User.search(params[:search_param])
      
      if @users_result 
         @users_result = current_user.except_current_user(@users_result)
         render partial: "friends/lookup"
      else
         render status: :not_found, nothing: true
         
      end
    end
    
    def friend_requests
       @friend_requests = current_user.requested_friends.paginate(page: params[:page], per_page: 20)
    end
    
    def send_friend_request
        current_user.friend_request(@friend)
        redirect_to :back
    end
    
    def decline_friend_request
        current_user.decline_request(@friend)
        redirect_to :back
    end
    
    def accept_friend_request
        current_user.accept_request(@friend)
        redirect_to :back
    end
    
    def remove_friend
        current_user.remove_friend(@friend)
        redirect_to :back
    end
    
    private
        def set_friend
            @friend = User.find(params[:id])
        end
end