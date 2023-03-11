class LikesController < ApplicationController

  # def create
  #   @post_like = Like.create(like_params)
  #   redirect_to post_path(params[:post_id])
  # end

  # def destroy
  #   @post_like = Like.find_by(like_params)
  #   @post_like.destroy
  #   redirect_to post_path(params[:post_id])
  # end

  # private
  # def like_params
  #   params.permit(user_id: current_user.id, post_id: params[:post_id])
  # end

  def create
    @like = Like.new(user_id: current_user.id, post_id: params[:post_id])
    @like.save
    redirect_to post_path(params[:post_id])
  end

  #下記を追加
  def destroy
    @like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
    @like.destroy
    redirect_to post_path(params[:post_id])
  end
end
