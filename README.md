ChaoCipher
==========

ChaoCipher is a Ruby implementation of the Chaocipher cipher, invented by J. F. Byrne; the algorithm was disclosed in 2010, hence this small bit of code!

The Algorithm
-------------

You can find more about the Chaocipher at [Wikipedia/Chaocipher](http://en.wikipedia.org/wiki/Chaocipher), and you can read the [online PDF](http://www.mountainvistasoft.com/chaocipher/ActualChaocipher/Chaocipher-Revealed-Algorithm.pdf) which contains details about the algorithm itself, upon which this code is based. The algorithm isn't that involved and is actually quite rudimentary.

# How do I use this thing?

To install from RubyGems:

    gem install chaocipher

To get the source:

    git clone https://github.com/aprescott/chaocipher.git

To run the tests with the source:

    rake test

To contribute:

* Fork it
* Make a new feature branch: `git checkout -b some-new-thing master`
* Hack away and add tests
* Pull request

## Basic usage

The Chaocipher works off two alphabets, a "left" and a "right" alphabet which are used for look-up during ciphering and deciphering. The initial two alphabets are all that is required to have a working cipher. For more details, it's probably best that you just read the PDF linked above.

    require "chaocipher"
    
    ciphertext_alphabet = "HXUCZVAMDSLKPEFJRIGTWOBNYQ"
    plaintext_alphabet = "PTLNBQDEOYSFAVZKGJRIHWXUMC"
    
    cipher = ChaoCipher::Cipher.new(ciphertext_alphabet, plaintext_alphabet)
    
    cipher.encrypt("WELLDONEISBETTERTHANWELLSAID") #=> "OAHQHCNYNXTSZJRRHJBYHQKSOUJY"

# Cryptographic security

I have no idea what the strength of this cipher is, so I wouldn't encrypt anything of utter importance with it, personally.
