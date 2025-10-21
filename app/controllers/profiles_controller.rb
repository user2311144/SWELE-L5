# app/controllers/profiles_controller.rb
class ProfilesController < ApplicationController
  # アクションの前に、必ず@userをセットする
  before_action :set_user

  def edit
    # ログイン中のユーザーのプロフィールを探す
    # もし存在しなければ、新しく作成（build）する
    @profile = @user.profile || @user.build_profile
  end

  def update
    # ログイン中のユーザーのプロフィールを探すか、新しく作成する
    @profile = @user.profile || @user.build_profile
    
    # フォームから送られてきた情報で更新
    if @profile.update(profile_params)
      redirect_to root_path, notice: 'プロフィールを更新しました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  # ログイン中のユーザー(@user)を取得する
  def set_user
    @user = User.find_by(uid: session[:login_uid])
  end

  # フォームから許可するデータ（:messageのみ）を選ぶ
  def profile_params
    params.require(:profile).permit(:message)
  end
end