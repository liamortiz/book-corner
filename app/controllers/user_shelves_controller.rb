class UserShelvesController < ApplicationController

  def new
    @user_shelf = UserShelf.new
  end


  def create
    @book = Book.find_by(isbn: params[:isbn])
    if @current_user
      UserShelf.find_or_create_by(user_id: @current_user.id, book_id: @book.id)
      redirect_to "/books/#{@book.isbn}"
    else
      redirect_to '/'#statics_path
    end
  end

  def destroy
    @shelf = UserShelf.find(params[:id])
    @book = @shelf.book

    @shelf.destroy
    redirect_to "/books/#{@book.isbn}"
  end
end
