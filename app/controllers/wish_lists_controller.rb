class WishListsController < ApplicationController
    before_action :set_wish_list, only: [:show, :update, :delete]

    def index
        @wish_list = WishList.where(user_id: logged_in_user.id)
        render json: {wish_lists: ActiveModelSerializers::SerializableResource.new(@wish_list, each_serializer: WishListSerializer) }
        # render json: {wish_lists: ActiveModelSerializers::SerializableResource.new(@WishList.all, each_serializer: WishListSerializer) }

    end
    
    def create
        wish_list = logged_in_user.wish_lists.create(wish_list_params)
        render json: wish_list
    end

    def show
       render json: @wish_list, serializer: WishListShowSerializer
    end

    def edit
    end

    def update
      if @wish_list.update(wish_params)
        render json: @wish_list, status: :created, location: @wish_list
      else 
        render json: @wish_list.errors, status: :unprocessable_entry
      end
    end

    def destroy
      @wish_list.delete
      @wish_list.wishes.delete_all
      render json: {WishId: @wish_list.id}
    end
    
    private
    
    def set_wish_list
        @wish_list = WishList.find_by_id(params[:id])
    end 

    def wish_list_params
        params.permit(:user_id, :name, :url)
    end

end