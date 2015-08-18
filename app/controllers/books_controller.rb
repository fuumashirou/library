class BooksController < ApplicationController
  respond_to :html
  before_action :authenticate_user!
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :set_authors, only: [:show, :index]

  def index
   # @books = Book.order("created_at").last(10)
   @q = Book.ransack(params[:q])
   @books = @q.result(distinct: true).page(params[:page]).per(5)
    respond_with(@books)
  end

  def show

    respond_with(@book)
  end

  def new
    @book = Book.new
    respond_with(@book)
  end

  def edit
  end

  def create
    @book = Book.new(book_params)

    if @book.save 
      redirect_to @book
    else 
      render 'new', notice: 'Hubo un error'
    end

  end

  def update
    @book.update(book_params)
    respond_with(@book)
  end

  def destroy
    @book.destroy
    respond_with(@book)
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :author, :editorial, :original_title, :translation, :edition, :edition_date, :edition_place, :publication_year, :image, :isbn, :editorial_id, :author_id)
    end

    def set_authors
      @authors = Author.all.order('name ASC')
    end

end
