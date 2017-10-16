class NomineesController < ApplicationController

  def index
    @category = Category.new
    @categories = Category.all
  end

  def new
    @categories = Category.all.where(status: 'Active').map{|u| [u.name,u.id]}
    @nominee = Nominee.new
  end

  def create
    @category = Category.find(params[:category_id])
    @nominee = Nominee.new(nominee_params)
    if Nominee.where(name: params[:nominee][:name]).present?
      if !@category.nominees.where(name: params[:nominee][:name]).present?
        flash.now[:alert] = 'Nominee is added'
        @category.nominees << @nominee
      else
      flash.now[:alert] = 'Nominee already exists in this category'
      end
    else
      flash.now[:alert] = 'Nominee is added'
      @nominee.save
      @category.nominees << @nominee
    end
    respond_to do |format|
      format.js
    end
  end

  def nominee_list
    @category = Category.find_by(id: params[:category])
    @nominees = @category.nominees
    respond_to do |format|
      format.js
    end
  end

  def like
    @vote = Vote.new
    @vote.user_id = current_user.id
    @vote.nominee_id = params[:nom_id]
    @vote.category_id = params[:id]
    if @vote.save
      respond_to do |format|
        format.js
      end
    end
  end

  # def check_nominee
  #   @category = Category.find_by(id: params[:category])
  #   byebug
  # end

  def destroy
    byebug
  end

  private

   def nominee_params
    params.require(:nominee).permit(:name,:picture,:description)
  end

end
