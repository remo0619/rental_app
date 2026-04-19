class DevicesController < ApplicationController
  before_action :set_device, only: [:show, :edit, :update, :destroy]

  def index
    @devices = Device.all
  end

  def show
    p @devices
  end

  def new
    @device = Device.new
  end

  def create
    @device = current_user.devices.build(set_params)
    if @device.save
      redirect_to devices_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_device
    @device = Device.find(params[:id])
  end

  def set_params
    params.require(:device).permit(:device_type, :serial)
  end
end
