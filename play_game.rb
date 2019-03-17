require './player.rb'
require './computer.rb'
require './game_display.rb'
include GameDisplay

def is_game_over
    if $computer.cracked? $player.guess
        puts "you won!"
    else
        puts "you lost!"
    end
end

def play_game
    GameDisplay::intro
    $computer = Computer.new
    $player = Player.new 
    for i in 1..6 do 
        puts "\nAttempt number #{i}"
        $player.make_guess
        $computer.attempt_to_crack_code $player.guess
        break if $computer.cracked? $player.guess
    end
end

play_game
is_game_over