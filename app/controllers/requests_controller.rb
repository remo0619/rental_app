class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @request = Request.new
    @device = Device.find(params[:device_id])
  end

  def create
    @request = current_user.requests.build(set_params)
    if @request.save
      redirect_to requests_path
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

  def set_request
    @request = Request.find(params[:id])
  end

  def set_params
    params.require(:request).permit(:start_date, :end_date)
  end
end
