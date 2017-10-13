class NomineesController < ApplicationController

  def index
    @categories = Category.all.map{|u| [u.name,u.id]}
  end

  def new
    @categories = Category.all.map{|u| [u.name,u.id]}
    @nominee = Nominee.new
  end

  def create
    @category = Category.find(params[:category_id])
    @nominee = Nominee.new(nominee_params)
    @nominee.save
    @category.nominees << @nominee
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
      flash[:success] = "Successfully voted !!! Thanks for voting!!!"
      redirect_to root_path
    else
      redirect_to root_path
    end

  end

  def unlike
    @nominee = Nominee.find(params[:id])
   # @vote = Vote.find_by(user_id: current_user_id && nominee_id: @nominee.id)
   # byebug
  end

  private

   def nominee_params
    params.require(:nominee).permit(:name,:picture)
  end

end
