class UsersController < ApplicationController
  before_action :set_user, only: [:library]

  # GET /users/1/library
  def library
    render json: @user.purchases.to_json(except: [:id, :purchase_option_id, :user_id, :created_at, :updated_at], methods: ['content', 'remaining_time'])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:user_id])
    end
end