module ChaoCipher
  class Cipher    
    def initialize(ciphertext_alphabet, plaintext_alphabet)
      @original_ciphertext_alphabet = ciphertext_alphabet
      @original_plaintext_alphabet = plaintext_alphabet
      @ciphertext_alphabet = Alphabet.new(ciphertext_alphabet.upcase.chars.to_a, :ciphertext)
      @plaintext_alphabet = Alphabet.new(plaintext_alphabet.upcase.chars.to_a, :plaintext)
    end
    
    def reinitialize!
      @ciphertext_alphabet = Alphabet.new(@original_ciphertext_alphabet.upcase.chars.to_a, :ciphertext)
      @plaintext_alphabet = Alphabet.new(@original_plaintext_alphabet.upcase.chars.to_a, :plaintext)
    end
    
    def plaintext_letter_for(ciphertext_letter)
      @plaintext_alphabet.characters[@ciphertext_alphabet.characters.index(ciphertext_letter)]
    end
    
    def ciphertext_letter_for(plaintext_letter)
      @ciphertext_alphabet.characters[@plaintext_alphabet.characters.index(plaintext_letter)]
    end
        
    def cipher(mode, text)
      reinitialize!
      
      converted_text = ""
      
      text.chars.each do |character|
        if mode == :encrypt
          @last_converted_letter = ciphertext_letter_for(character)
          @ciphertext_alphabet.permute!(@last_converted_letter)
          @plaintext_alphabet.permute!(character)
        else
          @last_converted_letter = plaintext_letter_for(character)
          @ciphertext_alphabet.permute!(character)
          @plaintext_alphabet.permute!(@last_converted_letter)
        end
        
        converted_text << @last_converted_letter
      end
      
      converted_text
    end
    
    def encrypt(plaintext)
      cipher(:encrypt, plaintext)
    end
    
    def decrypt(ciphertext)
      cipher(:decrypt, ciphertext)
    end
  end
end