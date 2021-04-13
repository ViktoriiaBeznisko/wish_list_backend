class WishListsController < ApplicationController
    before_action :set_wish_list, only: [:show, :update, :delete]

    def index
        # wish_lists = WishList.where(user_id: logged_in_user.id)
        wish_lists = WishList.all
        render json: wish_lists, each_serializer: WishListSerializer
    end
    
    def create
        wish_list = logged_in_user.wish_lists.create(wish_list_params)
        render json: wish_list
    end

    def show
      # binding.pry
       render json: @wish_list, serializer: WishListSerializer
    end

    def edit
    end

    def update   
      # @wish_list = WishList.find_by_id(params[:id])
       if @wish_list.update(wish_list_params)
        render json: @wish_list, status: 200
      else 
        render json: @wish_list.errors, status: :unprocessable_entry
      end
    end

    def destroy
      wish_list = WishList.find(params[:id])
      wish_list.delete
      wish_list.wishes.delete_all
      render json: wish_list
      # render json: {WishId: @wish_list.id}
    end
    
    private
    
    def set_wish_list
        @wish_list = WishList.find_by_id(params[:id])
        # @wish_list = WishList.find(params[:id])
    end 

    def wish_list_params
        # params.permit(:user_id, :name, :url)
        params.require(:wish_list).permit(:user_id, :name, :url)
    end

end
