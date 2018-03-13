class UsersController < ApplicationController
  def index
    if current_user.admin?
      @users = User.all.order(email: :asc)
      @physicians = Physician.all.order(name: :asc)
      @physician_reviews = PhysicianReview.all.order(created_at: :desc)
    else
      redirect_to "/physicians"
    end
  end
end
