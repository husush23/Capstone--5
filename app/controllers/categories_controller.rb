class CategoriesController < ApplicationController
  def index
    @categories = Category.where(user_id: current_user.id)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user = current_user

    if @category.save
      redirect_to categories_path, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
    @exchanges = @category.exchanges
    @total_amount = @exchanges.sum(:amount)
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
