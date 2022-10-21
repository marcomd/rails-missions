require 'rails_helper'

RSpec.describe Api::V1::FibonacciController, type: :controller do

  describe "#index" do
    subject { post :index }

    it do
      subject
      expect(json.class).to eq Array
    end

    context "when there are some records" do
      before do
        attributes = 10.times.map { |i| { value: i, result: i+1, runtime: (i+1) * 1000 } }
        Fibonacci.create(attributes)
      end

      specify do
        subject
        record = json[0]
        expect(record["value"]).to eq 0
        expect(record["result"]).to eq 1
        expect(record["runtime"]).to eq "1000.0"
        expect(record["created_at"]).to match /\A20\d\d-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}/
      end

      it "returns only 10 records" do
        subject
        expect(json[9].present?).to eq true
        expect(json[10].present?).to eq false
      end
    end
  end

  describe "#create" do
    subject { post :create, params: }

    context "when parameters are present" do
      let(:params) { { n: 10 } }

      specify do
        subject
        expect(json["result"]).to eq 55
        expect(json["runtime"].to_s).to match /\d*\.\d*/
      end

      it do
        expect do
          subject
        end.to change(Fibonacci, :count).by(1)
      end
    end

    context "when parameters are missing" do
      let(:params) { {} }

      it do
        subject
        expect(json).to eq({ "error" => "Please set the param 'n'" })
      end

      it do
        expect do
          subject
        end.to_not change(Fibonacci, :count)
      end
    end
  end

end
