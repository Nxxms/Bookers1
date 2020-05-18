class BooksController < ApplicationController

  def top
  end

  def index
  	@books = Book.all  	#desk降順、asc昇順
  	@book = Book.new
 # 　 redirect_to books_path
  end

  def show
  	@book = Book.find(params[:id])
  end

  def create
  	@book = Book.new(book_params)
  		if @book.save
  			flash[:notice] = "Book was successfully created."
  			redirect_to book_path(@book.id) #詳細画面へリダイレクト
  		else
  			@books = Book.all
  			#if文前に定義するとRspecエラーが起きる：indexですでに定義されており必要ない
  		 	render :index
  		end
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	@book = Book.find(params[:id])
  	@book.update(book_params)

  	if @book.update(book_params)
  		flash[:notice] = "Book was successfully updated."
  		redirect_to book_path(@book.id)
  	else
  		render :edit
  	end
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy

  	if book.destroy
  		flash[:notice] = "Book was successfully destroyed."
  		redirect_to books_path #book一覧画面へリダイレクト
  	end
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end

end
