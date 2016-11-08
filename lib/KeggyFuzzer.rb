require 'KeggyFuzzer/version'
require 'hammer-parser'
require 'KeggyFuzzer/KeggyRecurse'

module KeggyFuzzer
  # Class to perform the fuzzer generation
  class KeggyFuzzer
    attr_accessor :hammer, :length, :return_recurse
    # Constructor 
    # Assign only if the arguments were of valid formats, quit otherwise.
    def initialize(hammer, length)
      if hammer.class != Hammer::Parser or length.class != Fixnum
        puts "Quitting - Arguments were #{hammer.class} and #{length.class}."
        exit
      else
        @hammer = hammer
        @length = length
        @return_recurse = KeggyRecurse.caller(@hammer)
        puts @return_recurse
      end 
    end   # End initialize

    # hammer.action
    private def action(args)
    end
    
    # hammer.sequence - join more than 1 string
    private def sequence(args)
    end

    # hammer.token
    private def token(args)
    end

    # hammer.many - 0 or more occurences of whatever is given
    private def many(args)
    end

    # hammer.many1 - 1 or more occurences of whatever is given
    private def many1(args)
    end

    # hammer.ch - 1 character
    private def ch(args)
    end

    # hammer.ch_range - 1 character in the range
    private def ch_range(args)
    end

    # hammer.in - choices
    private def in(args)
    end
  end   # End Class
end     # End Module
