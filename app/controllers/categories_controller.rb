class CategoriesController < ApplicationController


  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @categories = Category.all.order(created_at: :desc)
    if @category.save
      respond_to do |format|
        format.js
      end
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      redirect_to categories_path
    end
  end

  def show
  end

  def index
    @categories = Category.all.order(created_at: :desc)
  end

  def destroy
    @category = Category.find(params[:id]).destroy
    @categories = Category.all.order(created_at: :desc)
    respond_to do |format|
      format.js
    end
  end

  def remove_nominee
    @category = Category.find(params[:id])
    @nominee = Nominee.find(params[:nominee_id])
    @category.nominees.delete(@nominee)
    @nominees = @category.nominees
     respond_to do |format|
      format.js
    end
  end

  def result
     @categories = Category.all.map{|u| [u.name,u.id]}
  end

  def winner_show
    @category = Category.find_by(id: params[:category])
    @winners = Vote.winner(@category)
    respond_to do |format|
      format.js
    end
  end

  def check_category
    @name = params[:data_value]
    @category = Category.find_by(name: @name)
    respond_to do |format|
      format.js
    end
  end



  private

  def category_params
    params.require(:category).permit(:name,:end_date,:description)
  end



end
