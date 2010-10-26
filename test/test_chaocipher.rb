require "test/unit"

require "ext/core/array/rotate"
require "lib/chaocipher"

class TestChaoCipher < Test::Unit::TestCase
  def setup
    ciphertext_alphabet = "HXUCZVAMDSLKPEFJRIGTWOBNYQ"
    plaintext_alphabet = "PTLNBQDEOYSFAVZKGJRIHWXUMC"
    @cipher = ChaoCipher::Cipher.new(ciphertext_alphabet, plaintext_alphabet)
  end
  
  def test_encryption
    assert_equal "OAHQHCNYNXTSZJRRHJBYHQKSOUJY", @cipher.encrypt("WELLDONEISBETTERTHANWELLSAID")
  end
  
  def test_decryption
    assert_equal "WELLDONEISBETTERTHANWELLSAID", @cipher.decrypt("OAHQHCNYNXTSZJRRHJBYHQKSOUJY")
  end
  
  def test_reversible
    ciphertext_alphabet = ("A".."Z").to_a.shuffle.join("")
    plaintext_alphabet = ("A".."Z").to_a.shuffle.join("")
    
    cipher = ChaoCipher::Cipher.new(ciphertext_alphabet, plaintext_alphabet)
    
    str = ("A".."Z").to_a.shuffle.join("")
    
    assert_equal str, cipher.decrypt(cipher.encrypt(str))
  end
end