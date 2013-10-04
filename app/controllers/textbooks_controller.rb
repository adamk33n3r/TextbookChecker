class TextbooksController < ApplicationController
  before_action :set_textbook, only: [:show, :edit, :update, :destroy]

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
    respond_to do |format|
      if @textbook.save
        format.html { redirect_to @textbook, notice: 'Textbook was successfully created.' }
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
        format.html { redirect_to @textbook, notice: 'Textbook was successfully updated.' }
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
      @book_info = find params
      @textbook = Textbook.new
      @textbook.title = @book_info.title
      @textbook.authors = @book_info.authors.join(", ")
      @textbook.isbn = @book_info.industryIdentifiers[1].identifier
      @textbook.description = @book_info.description
      @textbook.image_url = @book_info.imageLinks.thumbnail
    end
  end
  
  private
  
    def find(params)
      response = HTTParty.get("https://www.googleapis.com/books/v1/volumes?q=isbn:" + params[:isbn] + "&key=AIzaSyDqJ6dEoT_kIbfBSV8ztbZOqzZCqRRQtQc&country=US")
      book_hash = response["items"][0]["volumeInfo"]
      Hashie::Mash.new book_hash
    end
  
    # Use callbacks to share common setup or constraints between actions.
    def set_textbook
      @textbook = Textbook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def textbook_params
      p = params.require(:textbook).permit(:title, :authors, :edition, :price, :date, :isbn)
      p[:title] = p[:title].titleize
      p[:authors] = p[:authors].titleize
      p[:edition] = p[:edition].titleize
      p
    end
end
