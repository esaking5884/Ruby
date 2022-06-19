# coding: utf-8
require "csv"

def Menu()
  puts "1(メモを作成) 2(既存のメモを編集する)"
  case gets.chomp
  when "1"
    New_memo()
  when "2"
    Edit()
  else
    puts "Exit"
    return false
  end
end

def New_memo()
  puts "拡張子を除いたファイルを入力してください"
  file_name = gets.chomp
  if file_name == ""
    puts "Return to menu."
    return
  else
    file_name += ".csv"
  end
  puts "Input text."
  text = [gets.chomp]
  CSV.open(file_name,"w") do |file|
    file << text
  end
  puts "Saved."
end

def Edit()
  puts "拡張子を除いたファイルを入力してください"
  file_name = gets.chomp
  if file_name == ""
    puts "Return to menu."
    return
  else
    file_name += ".csv"
  end
  read_memo = []
  begin
    CSV.foreach(file_name) do |temp|
      read_memo = temp
    end
  rescue
    puts "Not found."
    return
  end
  puts "---text---"
  puts read_memo
  puts "----------"
  puts "Inuput new text."
  text = [gets.chomp]
  if text[0] == ""
    puts "Cancelled."
    return
  end
  CSV.open(file_name,"w") do |file|
    file << text
  end
  puts "Saved."
end

bool = true
while bool != false
  bool = Menu()
end