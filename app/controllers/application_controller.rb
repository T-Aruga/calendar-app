class ApplicationController < ActionController::Base
  include SessionsHelper
  # before_action :authenticate_user!
  # before_action :check_xhr_header


  private

    def authenticate_user!
      return if logged_in?
      render json: { error: 'unauthorized' }, status: :unauthorized
    end

    # def check_xhr_header
    #   return if request.xhr?
    #   render json: { error: 'forbidden' }, status: :forbidden
    # end
end
