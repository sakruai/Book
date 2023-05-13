class BooksController < ApplicationController
  def new
    @book = Book.new
    @books = Book.all
    
  end
  
  def create
    @book = Book.new(book_params)
    if @book.save
    redirect_to book_path(@book.id)
    flash[:notice] = "successfully" 
  else
    @books = Book.all 
    render :index
  end
  
  end
  
  def index
    @book = Book.new
    @books = Book.all
  end

  def show
   @book = Book.find(params[:id])
  end

  def edit
   @book = Book.find(params[:id]) 
   
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book.id)  
    flash[:notice] = "successfully" 
    else
      render :edit
    end
    
  end
  
  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to '/books'  # 投稿一覧画面へリダイレクト 
    flash[:notice] = "successfully" 
  end
  
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
