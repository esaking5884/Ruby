def Janken()
	hands = ["グー","チョキ","パー"]
	if $aiko
		puts "あいこで..."
	else
		puts "じゃんけん..."
	end
	puts "0(グー)1(チョキ)2(パー)3(戦わない)"
	my_hand = gets.chomp.to_i
	if my_hand != 0 && my_hand != 1 && my_hand != 2
		exit
	end
	if $aiko
		puts "ショ"
	else
		puts "ホイ"
	end
	opponent_hand = rand(3)
	puts "----------------"
	puts "あなた：" + hands[my_hand] + "を出しました"
	puts "相手：" + hands[opponent_hand] + "を出しました"
	puts "----------------"
	case my_hand
	when 0
		if opponent_hand == 1
			Win_hoi()
		elsif opponent_hand == 2
			Lose_hoi()
		elsif opponent_hand == 0
			$aiko = true
		end
	when 1
		if opponent_hand == 2
			Win_hoi()
		elsif opponent_hand == 0
			Lose_hoi()
		elsif opponent_hand == 1
			$aiko = true
		end
	when 2
		if opponent_hand == 0
			Win_hoi()
		elsif opponent_hand == 1
			Lose_hoi()
		elsif opponent_hand == 2
			$aiko = true
		end
	end
		
end

	

def Win_hoi()
	direc = ["上","右","下","左"]
	puts "あっちむいて〜"
	puts "0(上)1(右)2(下)3(左)"
	my_direction = gets.chomp.to_i
	opponent_deirection = rand(4)
	puts "ホイ"
	puts "----------------"
	puts "あなた：" + direc[my_direction] 
	puts "相手：" + direc[opponent_deirection]
	puts "----------------"
	if my_direction != 0 && my_direction != 1 && my_direction != 2 && my_direction != 3
		Win_hoi()
	end
	if my_direction == opponent_deirection
		puts "YOU WIN"
		exit
	else
		$aiko = false
		return
	end
end

def Lose_hoi()
	direc = ["上","右","下","左"]
	puts "あっちむいて〜"
	puts "0(上)1(右)2(下)3(左)"
	my_direction = gets.chomp.to_i
	opponent_deirection = rand(4)
	puts "ホイ"
	puts "----------------"
	puts "あなた：" + direc[my_direction] 
	puts "相手：" + direc[opponent_deirection]
	puts "----------------"
	if my_direction != 0 && my_direction != 1 && my_direction != 2 && my_direction != 3
		Lose_hoi()
	end
	if my_direction == opponent_deirection
		puts "YOU LOSE"
		exit
	else
		$aiko = false
		return
	end
end

$aiko = false
battle = true
while battle == true
	Janken()
end