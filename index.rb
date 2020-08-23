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
  if lists.any? { |hash| hash.value?(subject) }
    lists.each do |hash|
      if hash.value?(subject)
        hash[:time] += time
        break
      end
    end
  else
    lists.push({ subject: subject, time: time })
  end
end

def print_lists(lists)
  puts "学習記録\n\n"

  lists.each do |hash|
    square = "■ " * (hash[:time] / 15)
    puts "#{hash[:subject]} #{square}"
  end
end


### 実行パート ここから ###
lists = []

loop do
  puts "今日はどの項目を何分勉強した？"

  subject = input_subject
  time = input_time

  push_info(lists, subject, time)

  print_lists(lists)
end
