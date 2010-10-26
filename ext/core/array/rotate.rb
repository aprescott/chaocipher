class Array
  def rotate(n = 1)
    rotate_amount = n % size
    return self if rotate_amount < 1 # will be true if n < 1 or size < 2
    self[rotate_amount..-1] + self[0..rotate_amount-1]
  end
end