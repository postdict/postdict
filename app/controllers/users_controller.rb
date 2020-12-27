class UsersController < ApplicationController
  before_action :redirect_authorized, { only: [:signin_form, :signin, :signup_form, :signup] }
  before_action :redirect_unauthorized, { only: [:signout, :show, :update_name, :update_email, :update_password] }

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

  def destroy_form
    redirect_to "/account#destroy_form"
  end

  def destroy
    if @current_user.kind == "admin"
      flash[:alert] = "管理者は、自分自身の削除はできません。ほかの管理者に依頼して、「ユーザー一覧」ページから削除してもらってください。"
      redirect_to "/account"
      return
    end

    @current_user.destroy
    session[:user_id] = nil
    flash[:notice] = "アカウントを削除しました。"
    redirect_to "/"
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
end
