class TextbooksController < ApplicationController
  before_action :set_textbook, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_student!
  before_action only: [:edit, :update, :destroy] do
    unless current_student.admin?
      flash[:danger] = "You are not allowed to do that!"
      redirect_to :back
    end
  end

  # GET /textbooks
  # GET /textbooks.json
  def index
    @textbooks = Textbook.all
  end

  # GET /textbooks/1
  # GET /textbooks/1.json
  def show
  end

  # GET /textbooks/new
  def new
    @textbook = Textbook.new
  end

  # GET /textbooks/1/edit
  def edit
  end

  # POST /textbooks
  # POST /textbooks.json
  def create
    @textbook = Textbook.new(textbook_params)
    @book_info = TextbooksHelper.find_book textbook_params[:isbn]
    if @book_info
      @textbook = TextbooksHelper.build_book @book_info
    else
      flash.now[:danger] = "Invalid ISBN."
      render :new
      return
    end
    respond_to do |format|
      if @textbook.save
        flash[:success] = 'Textbook was successfully created by pulling data from Google Books.'
        flash[:info] = 'If any information needs to be changed or added, please add it now and update.'
        format.html { redirect_to edit_textbook_path(@textbook) }
        format.json { render action: 'show', status: :created, location: @textbook }
      else
        format.html { render action: 'new' }
        format.json { render json: @textbook.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /textbooks/1
  # PATCH/PUT /textbooks/1.json
  def update
    respond_to do |format|
      if @textbook.update(textbook_params)
        flash[:sucess] = 'Textbook was successfully updated.'
        format.html { redirect_to @textbook }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @textbook.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /textbooks/1
  # DELETE /textbooks/1.json
  def destroy
    @textbook.destroy
    respond_to do |format|
      format.html { redirect_to textbooks_url }
      format.json { head :no_content }
    end
  end
  
  def search
    if params[:isbn]
      @book_info = TextbooksHelper.find_book params[:isbn]
      if @book_info
        @textbook = TextbooksHelper.build_book @book_info
      else
        flash.now[:danger] = "Invalid!"
      end
    end
  end
  
  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_textbook
      @textbook = Textbook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def textbook_params
      params.require(:textbook).permit(:isbn)
    end
end
