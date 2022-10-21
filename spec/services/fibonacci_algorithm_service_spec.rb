require "spec_helper"

RSpec.describe FibonacciAlgorithmService do
  subject { described_class.call(n) }

  context "when n = 10" do
    let(:n) { 10 }
    it { expect(subject.success?).to eq true }
    it { expect(subject.result).to eq 55 }
  end

  context "when n = 123" do
    let(:n) { 123 }
    it { expect(subject.success?).to eq true }
    it { expect(subject.result).to eq 22698374052006863956975682 }
  end

end