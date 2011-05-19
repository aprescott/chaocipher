Gem::Specification.new do |s|
  s.name         = "chaocipher"
  s.version      = "0.0.1"
  s.authors      = ["Adam Prescott"]
  s.email        = ["adam@aprescott.com"]
  s.homepage     = "https://github.com/aprescott/chaocipher"
  s.summary      = "A Ruby implementation of the Chaocipher cipher."
  s.description  = "ChaoCipher is a Ruby implementation of the Chaocipher cipher, invented by J. F. Byrne; the algorithm was disclosed in 2010."
  s.files        = Dir["{lib/**/*,test/**/*}"] + %w[LICENSE Gemfile rakefile README.md chaocipher.gemspec .gemtest]
  s.require_path = "lib"
  s.test_files   = Dir["test/*"]
  s.add_development_dependency "rake"
end
