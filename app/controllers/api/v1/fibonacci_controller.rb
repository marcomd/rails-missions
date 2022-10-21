class Api::V1::FibonacciController < Api::BaseController

  def create
    if permitted_fibonacci[:n]
      @fibonacci = Struct.new(:id, :value, :result, :runtime).new(1, 10, 55, 67)
      render json: @fibonacci.to_json, status: :created
    else
      render json: { error: "Please set the param 'n'" }, status: :bad_request
    end
  end

  private

  def permitted_fibonacci
    params.permit(:n)
  end
end
