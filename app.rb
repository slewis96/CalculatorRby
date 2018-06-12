include Math

def calcchoose
  puts "\nChoose a calculator"
  puts "1=Basic 2=Advanced 3=BMI 4=Trip (Enter quit to quit)"
  calcchoice = gets.chomp
  if calcchoice != "quit"
    if calcchoice.to_i == 1
      basiccalc
    elsif calcchoice.to_i == 2
      advancedcalc
    elsif calcchoice.to_i == 3
      bmicalc
    elsif calcchoice.to_i == 4
      tripcalc
    else
      puts "\n Not a available calulator! try again"
      calcchoose
    end
  end
end

def basiccalc
  print "\nEnter an operator +, -, *, / (Enter back to go back): "
  usr_op = gets.chomp.strip
  if usr_op.downcase == "back"
    calcchoose
    return
  end
  print "\nEnter some numbers split with spaces (e.g. 2 2 3): "
  usr_nums = gets.chomp
  usr_nums = usr_nums.split(" ").map{|x| x.to_i}
  begin
    result = removeDecimals usr_nums.inject(usr_op.to_sym)
  rescue NoMethodError
    puts "\n Operator not valid try again:"
    basiccalc
  end
  puts "\n  --| #{result} |--"
  basiccalc
  #NoMethodError
end

def advancedcalc
  puts "\n Which operation would you like?"
  puts "1=Power 2=Square root (Enter back to go back)"
  usr_op = gets.chomp
  if usr_op == "back"
    calcchoose
    return
  end
  if usr_op.to_i == 1
    print "\nEnter the first number: "
    num1 = gets.chomp.to_i
    print "\nEnter the second number: "
    num2 = gets.chomp.to_i
    puts "\n  --| #{num1}^#{num2} = #{num1**num2} |--"
    advancedcalc
  elsif usr_op.to_i == 2
    print "\nEnter a number to square: "
    num1 = gets.chomp.to_i
    puts "\n  --| √#{num1} = #{removeDecimals Math.sqrt(num1)} |--"
    advancedcalc
  else
    puts "\nNot a available operator! try again"
    advancedcalc
  end
end

def bmicalc
  puts "\n Which measurement would you like?"
  puts "1=Imperial 2=Metric (Enter back to go back)"
  imperial_toggle = false
  usr_msr = gets.chomp
  if usr_msr == "back"
    calcchoose
    return
  end
  if usr_msr.to_i == 1
    imperial_toggle = true
  elsif usr_msr.to_i == 2
    imperial_toggle = false
  else
    puts "\nNot a available measurement! try again"
    bmicalc
  end

  print imperial_toggle ? "Enter your weight in pounds: " : "Enter your weight in kilograms: "
  weight = gets.chomp.to_f
  print imperial_toggle ? "Enter your height in inches: " : "Enter your height in meters: "
  height = gets.chomp.to_f

  result = weight/(height**2)
  result = imperial_toggle ? result*703 : result
  puts "\n #{removeDecimals result}"
  bmicalc
end

def removeDecimals num
  num.to_s.sub(/\.?0+$/, '')
end

#Run program
calcchoose
