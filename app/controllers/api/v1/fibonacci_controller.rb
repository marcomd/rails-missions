class Api::V1::FibonacciController < Api::BaseController

  def index
    @fibonaccis = Fibonacci.last(10)
    render json: @fibonaccis
  end

  def create
    unless permitted_fibonacci[:n]
      render json: { error: "Please set the param 'n'" }, status: :bad_request and return
    end

    n = permitted_fibonacci[:n].to_i
    start_time = Time.now
    service = FibonacciAlgorithmService.call(n)
    end_time = (Time.now - start_time) * 1000
    @fibonacci = Fibonacci.new(value: n,
                               result: service.result,
                               runtime: end_time)

    if @fibonacci.save
      render json: @fibonacci, status: :created
    else
      render json: { error: @fibonacci.errors.full_messages.to_sentence },
             status: :unprocessable_entity and return
    end
  end

  private

  def permitted_fibonacci
    params.permit(:n)
  end
end
