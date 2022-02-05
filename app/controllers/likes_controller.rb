# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    return if post.likes.find_by(user: current_user)

    post.likes.create(user: current_user)
    redirect_to post
  end

  def destroy
    like = post.likes.find_by(user: current_user)
    if like
      like.destroy
      redirect_to post
    end
  end

  private

  def post
    Post.find(params[:post_id])
  end
end
