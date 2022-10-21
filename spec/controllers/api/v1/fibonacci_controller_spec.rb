require 'rails_helper'

RSpec.describe Api::V1::FibonacciController, type: :controller do

  describe "#create" do
    subject { post :create, params: }

    context "when parameters are present" do
      let(:params) { { n: 10 } }

      it do
        subject
        expect(json["result"]).to eq 55
        expect(json["runtime"].to_s).to match /\d*\.\d*/
      end
    end

    context "when parameters are missing" do
      let(:params) { {} }

      it do
        subject
        expect(json).to eq({ "error" => "Please set the param 'n'" })
      end
    end
  end

end
