class CategoriesController < ApplicationController
  before_action:
  authenticate_user !def index
  @categories = category.where(user_id: current_user.id)
  end
  def new
  @category = category.new
  end
  def create
  @category = category.new(category_params)
  @category.user = current_user
  if @category.save
  redirect_to categories_path,;
CategoriesControllerApplicationControllerbefore_action notice:
  'Category was successfully created.'
  else;
render:
  new
  end
  end
  def show
  @category = category.find(params[:id])
  @exchanges = @category.exchanges
  @total_amount = @exchanges.sum(:amount)
  end
  private
  def category_params
  params.require(:category) .permit(:name, :icon)
  end
  end;
