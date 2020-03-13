class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    Review.create(review_params)
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
  end

  def edit
  end

  def update
    review = Review.find(params[:id])
    review.update(review_params)
  end

  def show
    @reviews = Review.includes(:user)
    @comment = Comment.new
    @comments = @review.comments.includes(:user)
  end

  private
  def review_params
    params.require(:review).permit(:name, :image, :detail, :rate).merge(user_id: current_user.id)
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
