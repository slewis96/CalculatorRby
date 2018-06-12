include Math
def calcchoose
  puts "\n Choose a calculator"
  puts "1=Basic 2=Advanced 3=BMI 4=Trip"
  calcchoice = gets.chomp.to_i
  if calcchoice == 1
    basiccalc
  elsif calcchoice == 2
    advancedcalc
  elsif calcchoice == 3
    bmicalc
  elsif calcchoice == 4
    tripcalc
  else
    puts "\n Not a available calulator! try again"
    calcchoose
  end
end

def basiccalc
  puts "\nEnter your sum including +, -, *, / (Enter back to go back)"
  usr_equation = gets.chomp
  if usr_equation.downcase == "back"
    calcchoose
  end
  begin
    puts "\n  --| #{usr_equation} = #{instance_eval(usr_equation)} |--"
  rescue
    puts "\n Not valid a valid sum try again:"
    basiccalc
  end
  basiccalc
end

def advancedcalc
  puts "\n Which operation would you like?"
  puts "1=Power 2=Square root (Enter back to go back)"
  usr_op = gets.chomp
  if usr_op.to_i == 1
    puts "\n Enter the first number"
    num1 = gets.chomp.to_i
    puts "\n Enter the second number"
    num2 = gets.chomp.to_i
    puts "\n  --| #{num1}^#{num2} = #{num1**num2} |--"
    advancedcalc
  elsif usr_op.to_i == 2
    puts "\n Enter a number to square"
    num1 = gets.chomp.to_i
    puts "\n  --| √#{num1} = #{Math.sqrt(num1)} |--"
    advancedcalc
  elsif usr_op == "back"
    calcchoose
  else
    puts "\n Not a available operator! try again"
    advancedcalc
  end
end

#Run program
calcchoose
