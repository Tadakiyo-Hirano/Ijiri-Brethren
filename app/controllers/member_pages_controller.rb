class MemberPagesController < ApplicationController
  before_action :signed_in_user

  def index
    # if !user_signed_in?
    #   flash[:danger] = "権限がありません。"
    #   redirect_to root_path
    # end
    @members_infos = Info.where(category: "メンバー")
    # @articles = Article.order(updated_at: :desc).limit(2)
    @movies = Movie.where(category: "メンバー")
    @galleries = Gallery.with_attached_image.order(:category, :id).group_by(&:category)
  end

  def articles
    @articles = Article.order(updated_at: :desc).limit(2)
  end

end