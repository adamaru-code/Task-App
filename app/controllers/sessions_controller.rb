class SessionsController < ApplicationController
  
  def new
    if logged_in?
<<<<<<< HEAD
      flash[:success] = "すでにログインしています。"
      redirect_to @current_user
    else
      render :new
=======
      flash[:info] = 'すでにログインしています。'
      redirect_to current_user
>>>>>>> editing-tasks
    end
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      flash[:success] = 'ログインしました。'
      redirect_back_or user
    else
      flash.now[:danger] = '認証に失敗しました。'
      render :new
    end
  end
  
   # ログイン中の場合のみログアウト処理を実行します。
  def destroy
    log_out if logged_in?
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
  end
end
