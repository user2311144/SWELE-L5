class TopController < ApplicationController
  def main
    @tweets = Tweet.all
  end

  def login
    # フォームから送られてきたuidを元にユーザーを検索
    user = User.find_by(uid: params[:uid])

    # ユーザーが見つかり、かつパスワードが一致したら
    if user && user.authenticate(params[:pass])
      session[:login_uid] = user.uid
      redirect_to root_path # ログイン成功後はトップページに戻す
    else
      # ログイン失敗時
      flash[:alert] = "ユーザーIDまたはパスワードが違います"
      render :main
    end
  end

  def logout
    # session情報をすべてリセットする
    reset_session
    # トップページにリダイレクト
    redirect_to root_path
  end
end