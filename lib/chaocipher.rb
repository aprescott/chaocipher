# Copyright (c) 2010 Adam Prescott
# Licensed under the MIT license. See LICENSE.

# Ruby 1.8
unless Array.new.respond_to?(:rotate)
  class Array
    def rotate(n = 1)
      rotate_amount = n % size
      return self if rotate_amount < 1 # will be true if n < 1 or size < 2
      self[rotate_amount..-1] + self[0..rotate_amount-1]
    end
  end
end

module ChaoCipher
  ZENITH_INDEX = 0
  NADIR_INDEX = 13
  ZENITH_POSITION = ZENITH_INDEX + 1
  NADIR_POSITION = NADIR_INDEX + 1
  
  VERSION_TINY = 1
  VERSION_MINOR = 0
  VERSION_MAJOR = 0
  
  VERSION = [VERSION_MAJOR, VERSION_MINOR, VERSION_TINY].join(".")
end

require "chaocipher/alphabet"
require "chaocipher/cipher"
