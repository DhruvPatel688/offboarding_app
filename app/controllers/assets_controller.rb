class AssetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_offboarding

  def index
    @assets = @offboarding.assets
  end

  def show
    @asset = @offboarding.assets.find(params[:id])
  end

  def new
    @asset = @offboarding.assets.new
  end

  def create
    @asset = @offboarding.assets.new(asset_params)
    if @asset.save
      redirect_to offboarding_assets_path(@offboarding), notice: "Asset created successfully"
    else
      render :new
    end
  end

  def edit
    @asset = @offboarding.assets.find(params[:id])
  end

  def update
    @asset = @offboarding.assets.find(params[:id])
    if @asset.update(asset_params)
      flash[:success] = "Asset updated successfully"
    else
      flash[:error] = "Failed to update asset"
    end
    redirect_to offboarding_assets_path(@offboarding)
  end

  def destroy
    @asset = @offboarding.assets.find(params[:id])
    @asset.destroy
    flash[:success] = "Asset deleted successfully"
    redirect_to offboarding_assets_path(@offboarding)
  end

  private

  def asset_params
    params.require(:asset).permit(:name, :returned, :condition, :notes)
  end

  def set_offboarding
    @offboarding = current_user.offboardings.find(params[:offboarding_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: "Not authorized to access this offboarding"
  end
end
