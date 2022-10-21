class Api::V1::FibonacciController < Api::BaseController

  def create
    if permitted_fibonacci[:n]
      n = permitted_fibonacci[:n].to_i
      start_time = Time.now
      service = FibonacciAlgorithmService.call(n)
      end_time = (Time.now - start_time) * 1000
      @fibonacci = Struct.new(:id, :value, :result, :runtime).new(1, n, service.result, end_time)
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
