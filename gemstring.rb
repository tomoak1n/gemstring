#!/bin/env ruby 

require_relative 'count'

$counter = Counter.new

p $counter.count([3,2,1])
p $counter.count([1,4,1,4,2,1,3])

def getnumber(targetstring, gempool)
  retv = 0
  (0...targetstring.size).each do |pos|
     c = targetstring[pos]
     gempool.each do |gemnumber|
       if gemnumber[0] < c
         h=Hash[*gempool.flatten]
         if(h[gemnumber[0]] > 0)
           h[gemnumber[0]] -= 1
           ar = h.to_a.transpose[1]
           ar.delete(0)
           ar.sort!
           retv += 1 + $counter.count(ar)
         end
       elsif gemnumber[0] == c
         retv += 1
         gemnumber[1] -= 1
         break
       else
         puts "something strange"
         p targetstring
         p gempool
         p gemnumber
         exit
       end
     end
  end
  retv
end

p "a"
p getnumber("a", [['a',3],['b',1],['c',2]])
p "aa"
p getnumber("aa", [['a',3],['b',1],['c',2]])
p "aab"
p getnumber("aab", [['a',3],['b',1],['c',2]])
p "caab"
p getnumber("caab", [['a',3],['b',1],['c',2]])
p "caabc"
p getnumber("caabc", [['a',3],['b',1],['c',2]])

def string2pool(str)
  h = {}
  str.split(//).each do |c|
    if h[c] == nil
      h[c] = 1
    else
      h[c] += 1
    end
  end
  h.to_a
end
p string2pool("aaabcc")
p string2pool("abbbbcddddeefggg")
p getnumber("eagcdfbe",string2pool("abbbbcddddeefggg"))
p getnumber(open("princess.txt").read.strip,string2pool(open("gems.txt").read.strip))
