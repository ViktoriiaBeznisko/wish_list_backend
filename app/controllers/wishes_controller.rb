class WishesController < ApplicationController
    before_action :set_wish, only: [:show, :update, :delete]
  
    def index
        render json: wish, serializer: WishSerializer
    end

    def create
        wish = logged_in_user.wish.create(wish_params)
      if wish.save 
        render json: wish
    end

    def show
        render json: @wish, serializer: WishSerializer
    end

    def edit
    end

    def update
      if @wish.update(wish_params)
          render json: @wish, status: :created, location: @wish
      else 
          render json: @wish.errors, status: :unprocessable_entry
      end
    end

    def destroy
        @wish.delete
        render json: {WishId: @wish.id}
    end
  
    private
  
    def set_wish
      @wish = Wish.find_by_id(params[:id])
    end

    def wish_params
      params.permit(:wish_list_id, :text, :link)
    end
  
  end