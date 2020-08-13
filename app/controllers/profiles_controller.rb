class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to users_path
    else
      render :new
    end
  end

  def edit
    if !current_user.profile.nil?
      @profile = Profile.find(current_user.profile.id)
    else
      @profile = Profile.new
    end
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :birthday).merge(user_id:current_user.id)
  end
end
