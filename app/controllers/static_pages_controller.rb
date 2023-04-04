class StaticPagesController < ApplicationController
  def home
    @category = Category.all
    @books = Book.all
  end

  def category
    @categories = Category.all.order(:name)
    @books = if params[:category].present? && params[:category] != '0'
                 @category = Category.find(params[:category]).name
                 Category.find(params[:category]).books
              else
                @category = 'All Category'
                Book.all
             end
        @books = @books.where('title LIKE?', "%#{params[:title]}%") if params[:title].present? &&(params[:title] != '')
        @books = @books.order(:title).page(params[:page])
    end
  def help
  end
end
