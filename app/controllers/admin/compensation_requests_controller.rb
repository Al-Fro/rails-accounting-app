class CompensationRequestsController < ApplicationController
  def index
    @compensation_requests = CompensationRequest.all
  end

  def show
    @compensation_request = CompensationRequest.find(params[:id])
  end

  def update
    @compensation_request = CompensationRequest.find(params[:id])
    @compensation_request.update!(status: 'approved')
  end


  private
    def permitted_params
      params.require(:compensation_request).permit(:amount, :reason, :currency, :status)
    end
end
