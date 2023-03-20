class StaticPagesController < ApplicationController
  def home
    @category = Category.all
    @books = Book.all
  end

  def category
    @categories = Category.all
    return unless params[:category].present? 
    @books = if params[:category] != '0'
                 @category = Category.find(params[:category]).name
                 Category.find(params[:category]).books
              else
                @category = 'All Category'
                Book.all
             end
      if params[:title].present? &&(params[:title] != '')
        @books = @books.where('title LIKE?', "%#{params[:title]}%")
      end
      @show_search = true
      @books = @books.order(:title).page(params[:page]).per(12)
   end
  def help
  end
end
