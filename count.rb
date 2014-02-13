#!/usr/bin/env ruby

class Counter
  def initialize
    @hash = {}
  end
  def count(ar)
    if ar.size==0
      return 0
    end
    return @hash[ar] if @hash[ar]!= nil
    c = 0
    (0...ar.size).each do |i|
      ad = ar.dup
      ad[i] -= 1
      ad.delete(0)
      ad.sort!
      c += 1 + count(ad)
    end
    @hash[ar] = c
    return c
  end
end

#counter = Counter.new

#p counter.count([1])
#p counter.count([3,2,1])

