class PhysicianReviewsController < ApplicationController
  before_action :authenticate_user!

  def edit
    @physician = Physican.find(params[:physician_id])
    @physician_review = PhysicianReview.find(params[:id])
  end

  def new
    @physician_review = PhysicianReview.new
    @physician = Physician.find(params[:physician_id])
  end

  def update
    @physician_review = PhysicianReview.find(params[:id])
    if @physician_review.update(physician_review_params)
      redirect_to physicians_path, notice: "Physician review was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @physician_review = PhysicianReview.find(params[:id])
    @physician_review.delete
    redirect_to physicians_path
    flash[:notice] = "Physician review was successfully deleted."
  end

  def create
    @physician_review = PhysicianReview.new(physician_review_params)
    @physician = Physician.find(params[:physician_id])
    @physician_review.physician = @physician
    @user = current_user
    @physician_review.user = @user

    if @physician_review.save
      flash[:notice] = "Review saved!"
      redirect_to physician_path(@physician)
    else
      flash[:errors] = "Review didn't save :-("
      render :new
    end
  end

  def authenticate_user
    if !user_signed_in?
      redirect_to new_user_session_path, notice: "You must be logged in."
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  # Never trust parameters from the scary internet, only allow the white list through.

  def physician_review_params
    params.require(:physician_review).permit(:rating, :physician_id)
  end
end
