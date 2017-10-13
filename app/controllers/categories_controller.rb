class CategoriesController < ApplicationController


  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
        flash[:success] = "New category created!!!"
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update_attributes(category_params)
  end

  def show
  end

  def index
    @categories = Category.all
  end

  def destroy
    @category = Category.find(params[:id]).destroy
  end

  def check_expiry
    @categories = Category.all
    @categories.each do |category|
      if !category.end_date.future?
        category.update(status: 'Expired')
      end
    end
  end


  private

  def category_params
    params.require(:category).permit(:name,:end_date)
  end



end
