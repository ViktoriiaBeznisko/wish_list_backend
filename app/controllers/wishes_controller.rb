class WishesController < ApplicationController
    before_action :set_wish, only: [:show, :update, :delete]
  
    def index
        wishes = Wish.all
        render json: wishes, each_serializer: WishSerializer
    end

    def create
        binding.pry
        wish = Wish.create(wish_params)
        #binding.pry
        render json: wish
    end

    def show
        render json: @wish, serializer: WishSerializer
    end

    def edit
    end

    def update
      if @wish.update(wish_params)
          render json: @wish, status: 200
      else 
          render json: @wish.errors, status: :unprocessable_entry
      end
    end

    def destroy
        wish = Wish.find(params[:id])
        wish.delete
        render json: wishes
    end
  
    private
  
    def set_wish
      @wish = Wish.find_by_id(params[:id])
    end

    def wish_params
      params.permit(:wish_list_id, :text, :link)
    end
  
  end