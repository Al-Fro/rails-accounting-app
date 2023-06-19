require 'rails_helper'

RSpec.describe CompensationRequestsController, type: :controller do
  let(:user) { create :user }

  before do
    login_as user
  end

  describe "GET index" do
    it "renders the index template" do
      get :index

      expect(response).to have_http_status(:success)
    end
  end
end
