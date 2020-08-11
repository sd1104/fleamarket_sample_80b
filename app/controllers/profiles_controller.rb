class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

  def create
    Profile.create(profile_params)
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :birthday)
  end
end
