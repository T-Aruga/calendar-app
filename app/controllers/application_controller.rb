class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # before_action :check_xhr_header


  private

    def authenticate_user!
      @current_user = User.find_by(id: session[:user_id])
      return if @current_user

      render json: { error: 'unauthorized' }, status: :unauthorized
    end

    # def check_xhr_header
    #   return if request.xhr?

    #   render json: { error: 'forbidden' }, status: :forbidden
    # end
end
