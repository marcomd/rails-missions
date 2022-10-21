require 'rails_helper'

RSpec.describe "Api::V1::Fibonacci", type: :request do

  describe "POST /create" do
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
