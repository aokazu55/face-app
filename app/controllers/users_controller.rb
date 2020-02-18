class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :favorite_list]
  before_action :check_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all.order(id: "DESC")
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'ユーザー登録が完了です！ログイン画面に進んでください！' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'ユーザー情報が更新されました！' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'ユーザーが削除されました。' }
      format.json { head :no_content }
    end
  end

  def favorite_list
    @favorites = current_user.favorite_posts.all
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :image_cache)
  end

  # def correct_user
  #   user = User.find(params[:id])
  #   if current_user != user
  #     redirect_to posts_path
  #   end
  # end

  def check_user
    @user = User.find(params[:id])
  unless current_user.id == @user.id
    flash[:notice] = "他のInfluencerは削除と編集できないよ！"
    redirect_to users_path
  end
end

end
