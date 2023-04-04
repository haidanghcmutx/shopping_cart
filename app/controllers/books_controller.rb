class BooksController < ApplicationController
        before_action :current_shop,only: %i[edit create update destroy index]
        before_action :authenticate_user!, only: %i[edit create destroy update]
        def new; end
        
        def show
          @book = Book.find(params[:id])
          puts params[:id]
          @shop = Shop.find(@book.shop_id) 
          @cart_detail = CartDetail.new
          @categories = []
          @book.categories.each do |category|
            @categories.push category.name
          end
        end

        def index
          @categories = Category.all.order(:name)
          @books = @current_shop.books
          @books = @books.where('title LIKE ?', "%#{params[:title]}%") if params[:title].present? && (params[:title] != '')
          @books = @books.order(:title).page(params[:page]).per(12)
        end
      
        def edit
          @book = @current_shop.books.find(params[:id])
          @category = Category.all.order(:name)
        end
      
        def create
          @book = @current_shop.books.build(book_params)
          if @book.save
            flash[:notice] = 'Book created successfully!'
            redirect_to shop_path(@current_shop)
          else
            flash[:alert] = 'Failed to create! Please make sure Title, Price, Amount field not empty!'
            redirect_to shop_path(@current_shop)
          end
        end
      
        def update
          @book = @current_shop.books.find(params[:id])
          if @book.update(book_params)
            flash[:notice] = 'Book has been updated!'
            redirect_to shop_path @current_shop
          else
            flash[:alert] = 'Failed to update!'
            render 'edit'
          end
        end
      
        def destroy
          @current_shop.books.find(params[:id]).destroy
          flash[:notice] = 'Book has been deleted!'
          redirect_to shop_path @current_shop
        end
      
        private
      
        def book_params
          params.require(:book).permit(:title, :author, :publisher, :price, :year, :amount, :description, :img_url,
                                       category_ids: [])
        end
      
        def current_shop
          @current_shop = Shop.find(params[:shop_id])
        end
      
end
