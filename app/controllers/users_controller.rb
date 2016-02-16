class UsersController
    
    def send_friend_request(user)
        current_user.friend_request(user)
    end
    
    def decline_friend_request(user)
        current_user.decline_request(user)
    end
    
    def add_friend(user)
        current_user.accept_request(user)
    end
    
    def remove_friend(user)
        current_user.remove_friend(user)
    end
end