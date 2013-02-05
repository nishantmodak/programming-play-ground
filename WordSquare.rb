# @author Nishant M.
# @date 05-February-2013
# @problem http://en.wikipedia.org/wiki/Word_square

class WordSquare 

	def process
		inputStrings = %w{HEART EMBER ABUSE RESIN TREND}
		twoD = Array.new()
		inputStrings.each {|a| twoD << a.chars.to_a }
		puts "Input is a Word Square ? " + isSquare(twoD,inputStrings[1].length)
 	end

 	def isSquare(twod,len)
 		if len > 2
 			if isSquare(twod,len-1)
 				getWords(twod,len)
 			else
 				"false"
 			end
 		else
 			getWords(twod,len)	
 		end
 	end

 	def getWords(a,len)
 		one = Array.new
 		two = Array.new
 		len.times do |i|
 			one << a[i][len-1]
 			two << a[len-1][i]
 		end
 		if one == two
 			"true"
 		else
 			"false"
 		end
 	end
end

w = WordSquare.new
w.process