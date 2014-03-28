class HomeController < ApplicationController
    before_action :signed_in_user, only: [:posting_board]
    
    def index
    end

    def posting_board
        
    end
    
    private
    
    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end
end
