class BookTagsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @tag = Tag.find(params[:tag_id])
    # require 'pry-byebug'
    # binding.pry
    @book_tag = BookTag.new(book: @book, tag: @tag)
    @book_tag.book_id = @book.id
    if @book_tag.save
      redirect_to book_path, notice: 'successfully added.'
    else
      render :new
    end
  end


  private

    def book_tag_params
      params.require(:book_tag).permit(:tag_name)
    end

end
