require 'rails_helper'

RSpec.describe "Api::V1::Fibonacci", type: :request do

  describe "GET /fibonacci" do
    subject { get "/api/v1/fibonacci" }

    it do
      subject
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /fibonacci" do
    subject { post "/api/v1/fibonacci", params: }

    context "when parameters are present" do
      let(:params) { { n: 10 } }

      it do
        subject
        expect(response).to have_http_status(:created)
      end
    end

    context "when parameters are missing" do
      let(:params) { {} }

      it do
        subject
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

end
