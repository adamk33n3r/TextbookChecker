class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :edit, :update, :destroy]
  before_action :set_ta, only: [:new, :create, :index]
  before_action :authenticate_student!

  def index
    @ratings = @ta.nil? ? Rating.all : Rating.where(textbook_association_id: @ta.id)
  end

  def show
  end

  def new
    @rating = Rating.new textbook_association: @ta
  end

  def edit
  end

  def create
    @rating = Rating.new(rating_params)
    @rating.content.strip!
    respond_to do |format|
      if @rating.save!
        format.html { redirect_to @rating, notice: 'Rating was successfully created.' }
        format.json { render action: 'show', status: :created, location: @course }
      else
        format.html { render action: 'new' }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @rating.update(rating_params)
        format.html { redirect_to @rating, notice: 'Rating was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @rating.destroy
    respond_to do |format|
      format.html { redirect_to ratings_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rating
      @rating = Rating.find(params[:id])
    end
  
    def set_ta
      @ta = TextbookAssociation.find_by_id init_rating_params
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rating_params
      params.require(:rating).permit(:content, :vote_id).merge params.permit(:textbook_association_id).merge(student: current_student)
    end
  
    def init_rating_params
      params.require(:textbook_association_id)
    end
end
