# app/controllers/users_controller.rb

class UsersController < ApplicationController
  # ユーザー一覧を表示する
  def index
    @users = User.all
  end

  # 新規登録用の空のユーザーオブジェクトを作成する
  def new
    @user = User.new
  end

  # 新規登録フォームから送られてきたデータでユーザーを作成する
  def create
    def create
      @user = User.new(user_params)
    if @user.save
      # 登録に成功したら、ユーザー一覧ページに移動する
      redirect_to users_path, notice: 'ユーザーを登録しました。'
    else
      # 失敗したら、再度新規登録ページを表示する
      render :new, status: :unprocessable_entity
    end
  end
  end

  # ユーザーを削除する
  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, notice: 'ユーザーを削除しました。'
  end

  private

  # Strong Parameters: セキュリティのため、許可したデータのみを受け取る
  def user_params
    params.require(:user).permit(:uid, :password)
  end
end