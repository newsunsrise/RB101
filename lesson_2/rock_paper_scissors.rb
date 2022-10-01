require 'yaml'
MESSAGES = YAML.load_file('rock_paper_scissors.yml')

VALID_ABRV = { 'r' => 'rock',
               'p' => 'paper',
               'sc' => 'scissors',
               'l' => 'lizard',
               'sp' => 'spock' }

VALID_CHOICES = VALID_ABRV.values

WINNING_COMBOS = {
  rock: { scissors: 'win', lizard: 'win' },
  paper: { rock: 'win', spock: 'win' },
  scissors: { paper: 'win', lizard: 'win' },
  lizard: { spock: 'win', paper: 'win' },
  spock: { rock: 'win', scissors: 'win' }
}

def prompt(message)
  puts("=> #{message}")
end

# convert abbreviated input if needed
def convert_choice(user_input)
  if VALID_ABRV.key?(user_input)
    VALID_ABRV[user_input]
  else
    user_input
  end
end

# define winning scenario
def win_round(first, second)
  WINNING_COMBOS[first.to_sym][second.to_sym] == "win"
end

# display result of round
def display_result(player, computer)
  if win_round(player, computer)
    prompt MESSAGES["you_won"]
  elsif win_round(computer, player)
    prompt MESSAGES["computer_won"]
  else
    prompt MESSAGES["tie"]
  end
end

# add one point for winner of the round
def add_point(player, computer)
  if win_round(player, computer)
    1
  else
    0
  end
end

# display current score
def display_score(player, computer)
  prompt("Your score is: #{player} vs. Computer #{computer}")
end

# end the game once 3 points is reached
def end_game(score_one, score_two)
  if score_one == 3 || score_two == 3
    true
  else
    false
  end
end

# announcing the winner
def display_winner(score_one)
  if score_one == 3
    prompt MESSAGES["grand_winner"]
  else
    prompt MESSAGES["grand_loser"]
  end
end

# option to play again
def play_again
  prompt MESSAGES["play_again"]
  answer = gets.chomp
  if answer.downcase.start_with?("y")
    true
  else
    false
  end
end

system("clear")

prompt MESSAGES["game_rules"]

sleep 2
puts("\n")

loop do
  player_choice = ""
  computer_choice = ""
  player_score = 0
  computer_score = 0

  loop do
    loop do
      prompt MESSAGES["pick_one"]
      player_choice = gets.chomp.downcase
      player_choice = convert_choice(player_choice)

      if VALID_CHOICES.include?(player_choice)
        break
      else
        prompt MESSAGES["not_valid"]
      end
    end

    computer_choice = VALID_CHOICES.sample

    prompt MESSAGES["shoot"]
    sleep 1
    puts("\n")
    puts("You Chose: #{player_choice.upcase}")
    puts("Computer Chose: #{computer_choice.upcase}")

    display_result(player_choice, computer_choice)

    player_score += add_point(player_choice, computer_choice)
    computer_score += add_point(computer_choice, player_choice)

    display_score(player_score, computer_score)
    sleep 1
    puts("\n")

    break if end_game(player_score, computer_score)
  end

  display_winner(player_score)
  puts("\n")
  break unless play_again

  system("clear")
end

prompt MESSAGES["thank_you"]
