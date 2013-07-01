class UsersController < ApplicationController
  def index
    @active_page = params[:page] || 1
    @active_page = @active_page.to_i
    offset_num = 20
    @last_page = User.count / offset_num
    redirect_to "/?page=#{@last_page}"   if @active_page > @last_page
    @users = User.by_karma.page(@active_page, offset_num)
  end
end
