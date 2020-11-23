class UsersController < ApplicationController
  before_action :redirect_authorized, { only: [:signin_form, :signin, :signup_form, :signup] }
  before_action :redirect_unauthorized, { only: [:signout, :show, :update_name, :update_email, :update_password] }
  before_action :redirect_nonadmin, { only: [:top, :index, :grant_form, :grant, :destroy_form, :destroy] }

  def signin_form
  end

  def signin
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.user_id
      flash[:notice] = "サインインしました。"
      redirect_to("/search")
    else
      @email = params[:email]
      @password = params[:password]
      @error_message = "メールアドレスまたはパスワードが違います。"
      render("signin_form")
    end
  end

  def signup_form
    @user = User.new
  end

  def signup
    @user = User.new(
      user_id: User.generate_user_id,
      name: params[:name],
      email: params[:email],
      password: params[:password],
      kind: "standard"
    )

    if params[:password] != params[:password_confirm]
      @error_message = "パスワードが一致しません。もう一度入力してください。"
      render("signup_form")
      return
    end

    if @user.save
      session[:user_id] = @user.user_id
      flash[:notice] = "アカウントを作成しました。"
      redirect_to("/search")
    else
      render("signup_form")
    end
  end

  def signout
    session[:user_id] = nil
    flash[:notice] = "サインアウトしました。"
    redirect_to "/"
  end

  def show
  end

  def update_name
    @current_user.name = params[:name]
    update_user_info_notify
  end

  def update_email
    @current_user.email = params[:email]
    update_user_info_notify
  end

  def update_password
    if params[:new_password].blank? || params[:password_confirm].blank?
      @error_message = "新しいパスワードを入力してください。"
      render "show"
      return
    end

    if params[:new_password] != params[:password_confirm]
      @error_message = "新しいパスワードが一致しません。もう一度入力してください。"
      render "show"
      return
    end

    if @current_user.authenticate(params[:current_password])
      @current_user.password = params[:new_password]
      @current_user.save
      flash[:notice] = "ユーザー情報を更新しました。"
      redirect_to "/account"
    else
      @error_message = "現在のパスワードが違います。もう一度入力してください。"
      render "show"
      return
    end
  end

  # Only for Admins

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
    if check_is_current_user(@user)
      return
    end
  end

  def destroy
    @user = User.find_by(user_id: params[:user_id])
    if check_is_current_user(@user)
      return
    end

    flash[:notice] = "ユーザー#{@user.name}を削除しました。"
    @user.destroy
    redirect_to "/adminmng/users/index"
  end

  private

  def update_user_info_notify
    if @current_user.save
      flash[:notice] = "ユーザー情報を更新しました。"
      redirect_to "/account"
    else
      render "show"
    end
  end

  def check_is_current_user(user)
    if user.user_id == @current_user.user_id
      flash[:alert] = "自分自身の削除はできません。"
      redirect_to "/adminmng/users/index"
      return true
    end
  end
end
