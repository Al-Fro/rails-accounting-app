class CompensationRequestsController < ApplicationController
  def index
    @compensation_requests = current_actor.compensation_requests

    CompensationRequestPolicy.authorize!(current_user, @compensation_requests, :index)
  end

  def show
    @compensation_request = CompensationRequest.find(params[:id])
  end

  def new
    @compensation_request = CompensationRequest.new
  end

  def edit
  end

  def create
    @compensation_request = CompensationRequest.new(permitted_params)
    @compensation_request.user = current_user
    @compensation_request.status = :pending

    if @compensation_request.save!
      redirect_to compensation_request_url(@compensation_request), notice: ["Compensation request was successfully created."]
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def permitted_params
      params.require(:compensation_request).permit(:amount, :reason, :currency)
    end
end
