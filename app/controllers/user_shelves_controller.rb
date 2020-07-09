class UserShelvesController < ApplicationController
  def create
    @book = Book.find_by(isbn: params[:isbn])
    if @user
      UserShelf.find_or_create_by(user_id: @user.id, book_id: @book.id)
      redirect_to "/books/#{@book.isbn}"
    else
      redirect_to statics_path
    end
  end

  def destroy
    @shelf = UserShelf.find(params[:id])
    @book = @shelf.book

    @shelf.destroy
    redirect_to "/books/#{@book.isbn}"
  end
end
