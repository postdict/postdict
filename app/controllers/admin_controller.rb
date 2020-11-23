class AdminController < ApplicationController
  before_action :redirect_nonadmin

  def top
  end

  def index
    @users = User.all
  end

  def grant_form
    @user = User.find_by(
      user_id: params[:user_id]
    )

    if @user.nil?
      flash[:alert] = "指定したユーザーが見つかりません。"
      redirect_to "/adminmng/users/index"
      return
    end

    if @user.kind == "admin"
      flash[:alert] = "指定したユーザーはすでに管理者です。"
      redirect_to "/adminmng/users/index"
    end
  end

  def grant
    @user = User.find_by(
      user_id: params[:user_id]
    )

    @user.kind = "admin"

    if @user.save
      flash[:notice] = "#{@user.name}に管理者権限を与えました。"
      redirect_to "/adminmng/users/index"
    else
      render "grant_form"
    end
  end

  def destroy_form
    @user = User.find_by(user_id: params[:user_id])
    if is_current_user(@user)
      flash[:alert] = "自分自身の削除はできません。"
      redirect_to "/adminmng/users/index"
      return
    end
  end

  def destroy
    @user = User.find_by(user_id: params[:user_id])
    if is_current_user(@user)
      flash[:alert] = "自分自身の削除はできません。"
      redirect_to "/adminmng/users/index"
      return
    end

    flash[:notice] = "ユーザー#{@user.name}を削除しました。"
    @user.destroy
    redirect_to "/adminmng/users/index"
  end
end
