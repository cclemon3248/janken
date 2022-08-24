class Player
  def hand
    puts "0:グー, 1:チョキ, 2:パー, 3:戦わない"
    input_hand = gets.to_i
        
    while true
      if input_hand == 0 || input_hand == 1 || input_hand == 2 || input_hand == 3
        return input_hand
      else
        puts "0〜3の数字を入力してください。"
        puts "0:グー, 1:チョキ, 2:パー"
        input_hand = gets.to_i
      end
    end
  end

  def hand2
    puts "あっちむいて"
    puts "0:上, 1:下, 2:左, 3:右"
    input_hand = gets.to_i
        
    while true
      if input_hand == 0 || input_hand == 1 || input_hand == 2 || input_hand == 3
        return input_hand
      else
        puts "0〜3の数字を入力してください。"
        puts "0:上, 1:下, 2:左, 3:右"
        input_hand = gets.to_i
      end
    end
  end

  def enemy
    return rand(3)
  end

  def enemy2
    return rand(4)
  end
end

class Janken
  def pon(player_hand, player_enemy)
    if player_hand == 3
      return 4
    end

    janken = ["グー", "チョキ", "パー"]
    puts "あなた：#{janken[player_hand]}"
    puts "相手：#{janken[player_enemy]}"
    puts "--------------------------------------------"
    
    if player_hand == player_enemy
      return 1
    elsif (player_hand == 0 && player_enemy == 1) || (player_hand == 1 && player_enemy == 2) || (player_hand == 2 && player_enemy == 0)
      return 2
    else
      return 3
    end
  end
end

class Janken2
  def pon2(player_hand2, player_enemy2)
    janken2 = ["上", "下", "左", "右"]
    puts "あなた：#{janken2[player_hand2]}"
    puts "相手：#{janken2[player_enemy2]}"
    puts "--------------------------------------------"
    
    if player_hand2 == player_enemy2
      return 1
    else
      return 2
    end
  end
end

player = Player.new
janken = Janken.new
janken2 = Janken2.new

puts "じゃんけん"
while true
  game_start = janken.pon(player.hand, player.enemy)

  case game_start
  when 1
    puts "あいこで..."
  when 2
    game_start2 = janken2.pon2(player.hand2, player.enemy2)
    if game_start2 == 1
      puts "あなたの勝ちです"
      break
    elsif game_start2 == 2
      puts "じゃんけん"
    end
  when 3
    game_start2 = janken2.pon2(player.hand2, player.enemy2)
    if game_start2 == 1
      puts "あなたの負けです"
      break
    elsif game_start2 == 2
      puts "じゃんけん"  
    end
  when 4
    puts "じゃんけんをやめます"
    break  
  end
end