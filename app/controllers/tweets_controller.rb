class TweetsController < ApplicationController
  def index
    @tweets =Tweet.all
  end

  def new
    @tweet =Tweet.new
  end
  def create
    # ログインしているユーザー情報をsessionから取得する
    user = User.find_by(uid: session[:login_uid])

    # フォームから送られたメッセージと、ログインユーザーのIDでツイートを作成
    Tweet.create(message: params[:message], user_id: user.id)

    # トップページに戻る
    redirect_to root_path
  end
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to root_path, notice: 'ツイートを削除しました。'
  end
end
