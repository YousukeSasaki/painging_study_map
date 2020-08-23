### メソッド ###
def input_subject
  print "学習項目を入力 > "
  gets.chomp
end

def input_time
  print "学習時間を入力 > "
  gets.chomp.delete("^0-9").to_i
end

def push_info(lists, subject, time)
  insert_time = if lists.key?(subject)
                  lists[subject] + time
                else
                  time
                end
  lists.store(subject, insert_time)
end

def print_lists(lists)
  puts "#####学習記録#####"
  lists.each do |key, value|
    square = "■ " * (value / 15)
    puts "#{key} #{square}"
  end
  puts "##################"
end

def input_y_n
  print "続けて入力しますか？ y/n > "
  loop do
    y_n = gets.chomp
    if y_n == "n"
      puts "お疲れ様でした！"
      exit
    elsif y_n == "y"
      puts "##################"
      return
    else
      print "不正な入力です。もう一度入力してください y/n > "
    end
  end
end

### 実行パート ここから ###
lists = {}

loop do
  puts "今日はどの項目を何分勉強した？"

  subject = input_subject
  time = input_time

  push_info(lists, subject, time)

  print_lists(lists)

  input_y_n
end
