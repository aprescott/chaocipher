module ChaoCipher
  class Alphabet
    attr_reader :characters, :type
    
    def initialize(characters, kind)
      @type = kind
      @characters = characters
      raise(ArgumentError, "given alphabet is not a permutation of A-Z") unless self.class.valid?(@characters)
    end
    
    def zenith
      @characters.first
    end
    
    def nadir
      @characters[NADIR_INDEX]
    end
    
    def permute(new_zenith)
      self.class.permute(@characters, new_zenith, type)
    end
    
    def permute!(new_zenith)
      @characters.replace(permute(new_zenith))
    end
    
    def self.permute(characters, new_zenith, type)
      if type == :ciphertext
        amount_to_skip = 1
      else
        amount_to_skip = 2
      end
      
      permuted_characters = characters.rotate(characters.index(new_zenith))
      permuted_characters = permuted_characters.rotate unless type == :ciphertext
      
      permuted_characters[0..amount_to_skip-1] + permuted_characters[amount_to_skip..NADIR_INDEX].rotate + permuted_characters[NADIR_INDEX+1..-1]
    end
    
    def self.valid?(characters)
      characters.sort.join("") =~ /[a-z]/i
    end
  end
end