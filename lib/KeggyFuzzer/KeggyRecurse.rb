module KeggyFuzzer
  class KeggyRecurse

    # The static method that gets called from outside. Should verify if it is the Hammer::Parser method.
    def self.caller(args)
      # puts args.inspect
      # only sequence, in and not_in return lists
      if args.name == :sequence
        array = []
        for i in args.dont_gc
          array.push(caller(i))
        end
        return_string = {:sequence => array}
        return return_string
      elsif args.name == :token
        return_string = {:token => args.dont_gc[1]}
        return return_string
      elsif args.name == :action
        return caller(args.dont_gc.first)
      elsif args.name == :ch
        return {:ch => args.dont_gc.first}
      elsif args.name == :many
        return {:many => caller(args.dont_gc.first)}
      elsif args.name == :ch_range
        return {:ch_range => [args.dont_gc.first, args.dont_gc.last]}
      elsif args.name == :in
        return {:in => args.dont_gc.first.split('')}
      elsif args.name == :end_p
        return {:end_p => nil}
      end
    end

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

  end
end
