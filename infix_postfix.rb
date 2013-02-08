#sample-input "it was or god not awesome"
#sampel-expeceted-output "it and was or god and not awesome"

operators = %w[and or]
query = ARGV[0]
tokens = query.split(" ")
e = (tokens-["or", "not"]).size
#puts e == tokens.size
#puts tokens, operators
puts tokens.count
postfix = Array.new
stack = Array.new
infix = Array.new
precedence = {
	"and" => 50,
	"or" => 50
}

tokens.count.times do |cnt|
	unless tokens[cnt] == 'and' || tokens[cnt] == 'or' || tokens[cnt] == 'not'
		if cnt == tokens.count-1
			infix<< tokens[cnt]
		else
			if tokens[cnt+1] == 'and' || tokens[cnt+1] == 'or'
				infix<< tokens[cnt] 
				infix<<tokens[cnt+1]
			else
				if tokens [cnt+1] == 'not'
					infix << tokens[cnt]
					infix << ' and ' + tokens[cnt+1]
				else
					infix<< tokens[cnt]
					infix<<'and'
				end
			end
		end
	end
end

puts infix.inspect

infix.each do |token|

	case token
	when 'and', 'or'
		if stack.empty? == true
			stack.push(token)		
		else
          	loop {  
          		if (stack.empty? == false && precedence[token]<=precedence[stack.last])
          			postfix.push(stack.pop)
          		else
          			stack.push(token)
          			break
          		end
          	 }
		end
	else
		postfix.push(token)
	end
end
if stack.empty? == false
	postfix.push(stack.pop)
end
puts "Postfix"
puts postfix.inspect


############ Evaluation of Postfix. to_sql #################

query_string = ""

postfix.each do |token|
	#if token.
end