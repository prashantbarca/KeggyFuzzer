module KeggyFuzzer
  #
  class KeggyRecurse

    private

    # hammer.many - 0 or more occurences of whatever is given
    def many(args)
      poss = []
      if args.class == String
        (0..10).to_a.each do |i|
          poss.push(args * i)
        end
      elsif args.class == Array
        args.each do |arg|
          (0..10).to_a.each do |i|
            poss.push(arg * i)
          end
        end
      end
      poss
    end
    
    # hammer.many1 - 1 or more occurences of whatever is given
    def many1(args)
      poss = []
      if args.class == String
        (1..10).to_a.each do |i|
          poss.push(args * i)
        end
      elsif args.class == Array
        args.each do |arg|
          (1..10).to_a.each do |i|
            poss.push(arg * i)
          end
        end
      end
      poss
    end

    # # hammer.optional
    # def optional(args)
    #   if args.name == :optional
    #     poss = [""]
    #     args.dont_gc.each do |d|
    #       poss = poss + d
    #     end
    #   end
    # end

    # hammer.choice
    def choice(args)
      if args.name == :choice
      end
    end

    # hammer.middle
    def middle(args)
      if args.name == :middle
        
      end
    end
    
    public

    # The static method that gets called from outside.
    # Should verify if it is the Hammer::Parser method.


    def caller(args)
      # puts args.inspect
      # only sequence, in and not_in return lists
      if args.name == :sequence
        array = []
        args.dont_gc.each do |i|
          array.push(caller(i))
        end
        poss = array[0]
        (1..array.length - 1).to_a.each do |j|
          current_pos = poss.map { |x| array[j].map { |y| x + y } }.flatten
          poss = current_pos
        end
        poss
      elsif args.name == :token
        [args.dont_gc[1]]
      elsif args.name == :action
        caller(args.dont_gc.first)
      elsif args.name == :ch
        [args.dont_gc.first]
      elsif args.name == :many
        many(caller(args.dont_gc.first))
      elsif args.name == :many1
        many1(caller(args.dont_gc.first))
      elsif args.name == :ch_range
        poss = []
        (args.dont_gc.first..args.dont_gc.last).each do |i|
          poss.push(i.chr)
        end
        poss
      elsif args.name == :in
        args.dont_gc.first.split('')
      elsif args.name == :end_p
        ['']
      elsif args.name == :optional
        poss = [""]
        poss + caller(args.dont_gc.first)
      elsif args.name == :choice
        poss = []
        args.dont_gc.each do |choice|
          poss = poss + caller(choice)
        end
        poss
      elsif args.name == :middle
        zeroth = caller(args.dont_gc[0])
        first = caller(args.dont_gc[1])
        second = caller(args.dont_gc[2])
        poss = zeroth.map {|x| first.map {|y| second.map {|z| x + y + z} } }.flatten
        poss
      end
    end
  end
end
