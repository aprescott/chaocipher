$:.unshift(File.expand_path(File.dirname(__FILE__))) unless
    $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module ChaoCipher
  ZENITH_INDEX = 0
  NADIR_INDEX = 13
  ZENITH_POSITION = ZENITH_INDEX + 1
  NADIR_POSITION = NADIR_INDEX + 1
  
  VERSION_QUALIFIER = "pre"
  VERSION_TINY = 1
  VERSION_MINOR = 0
  VERSION_MAJOR = 0
  
  VERSION = [VERSION_MAJOR, VERSION_MINOR, VERSION_TINY].join(".") << VERSION_QUALIFIER
end

require "ext/core/array/rotate"
require "chaocipher/alphabet"
require "chaocipher/cipher"