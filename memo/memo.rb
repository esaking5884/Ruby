# coding: utf-8
require "csv"
  
def Saving(memo)
  CSV.open("memo.csv","w") do |temp|
    memo.each do |line|
      temp << line
    end
  end
  puts "Saved"
end
def Write(memo)
  puts "Title?"
  title = gets.chomp
  puts "Main?"
  main = gets.chomp
  if title == "" && main == ""
    puts "EMPTY! Return Menu."
    return
  end
  new_memo = [title, main]
  memo.push(new_memo)

  Saving(memo)
  
end

def Edit(memo)
  if memo.size == 0
    puts "Memo is enpty."
    return
  end
  size = memo.size - 1
  for i in 0..size
    puts "ID:" + i.to_s + "   Title:" + memo[i][0]
  end
  puts "Select ID"
  id = gets.chomp.to_i
  if id < 0  || id >size || id.class != Integer
    puts "ID Error. Return Menu."
    return
  end
  puts "Title: " + memo[id][0]
  puts "Text : " + memo[id][1]
  puts "1:Edit  2:Delete Others:Menu"
  edit_or_menu = gets.chomp
  if edit_or_menu == "2"
    puts "Delete this Memo."
    puts "1:Yes Others:No"
    del = gets.chomp
    if del == "1"
      memo.delete_at(id)
      Saving(memo)
      return
    end
  elsif edit_or_menu != "1"
    return
  end

  puts "Input New Title."
  new_title = gets.chomp
  if new_title != ""
    memo[id][0] = new_title
  else
    puts "Title is inherited."
  end
  puts "Input New Text."
  new_text = gets.chomp
  if new_text != ""
    memo[id][1] = new_text
  else
    puts "Text Is Inherited."
  end
  Saving(memo)
end

def Menu()
  puts "Choose Action.\n1:Write 2:Read Others:Quit"
  action = gets.chomp
  memo = []
  CSV.foreach("memo.csv") do |row|
    memo.push(row)
  end 
  case action
    when "1"
      Write(memo)
    when "2"
      Edit(memo)
    else
      puts "Quit"
      return false
  end
end

bool = true
while bool != false
  bool = Menu()
end