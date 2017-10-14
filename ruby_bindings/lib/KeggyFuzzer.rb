require 'KeggyFuzzer/version'
require 'hammer-parser'
require 'KeggyFuzzer/KeggyRecurse'

module KeggyFuzzer
  # Class to perform the fuzzer generation
  class KeggyFuzzer
    attr_accessor :hammer, :length, :testcases
    # Constructor
    # Assign only if the arguments were of valid formats, quit otherwise.
    def initialize(hammer, length)
      if hammer.class != Hammer::Parser || length.class != Fixnum
        puts "Quitting - Arguments were #{hammer.class} and #{length.class}."
        exit
      else
        @hammer = hammer
        @length = length
        @testcases = KeggyRecurse.new.caller(@hammer)
      end
    end                         # End initialize

    #
    def test_parsers
      failed_cases = []
      @testcases.each do |testcase|
        if @hammer.parse(testcase).nil?
          puts "#{testcase} didn't pass"
          failed_cases.push(testcase)
        end
      end
      if failed_cases.empty?
        true
      else
        false
      end
    end                         # End test
  end                           # End Class
end                             # End Module
