class FibonacciAlgorithmService
  prepend SimpleCommand

  def initialize(n)
    @n = n
  end

  def call
    fibonacci = Hash.new {|hash, key| hash[key] = key < 2 ? key : hash[key-1] + hash[key-2] }
    fibonacci[n]
  end

  private

  attr_reader :n
end