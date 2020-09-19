class UsersController < ApplicationController
  def index
  end

  def signin_form
    @user = User.new
  end

  def signin
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.user_id
      flash[:notice] = "サインインしました。"
      redirect_to("/")
    else
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
      family_name: params[:family_name],
      first_name: params[:first_name],
      email: params[:email],
      password: params[:password]
    )

    if params[:password] != params[:password_confirm]
      @error_message = "パスワードが一致しません。もう一度入力してください。"
      render("signup_form")
      return
    end

    if @user.save
      session[:user_id] = @user.user_id
      flash[:notice] = "アカウントを作成しました。"
      redirect_to("/")
    else
      render("signup_form")
    end
  end
end
