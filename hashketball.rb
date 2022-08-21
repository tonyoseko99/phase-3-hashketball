# Write your code below game_hash
require 'pry'
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# Write code here
def num_points_scored(name)
  game_hash.find do |team, val|
    val[:players].find do |grp|
      if !grp[:player_name].include?(name)
        next
      end
      return grp[:points]
    end
  end
  return "No such team found"
end

# puts num_points_scored('Kemba')

def shoe_size(name)
  game_hash.find do |team, val|
    val[:players].find do |grp|
      if !grp[:player_name].include?(name)
        next
      end
      return grp[:shoe]
    end
  end
  return "No such team found"
end

# puts shoe_size('Kemba')

def team_colors(team_name)
  game_hash.find do |team, val|
    if val[:team_name].include?(team_name)
      return val[:colors]
    else
      next
    end
  end
  return "No such team found"
end

# p team_colors("Char")

def team_names
  empty = []
  game_hash.collect do |team, val|
    empty << val[:team_name]
  end
  empty
end

# p team_names

def player_numbers(team_name)
  empty = []
  game_hash.find do |team, val|
    if val[:team_name].include?(team_name)
      val[:players].collect do |grp|
        empty << grp[:number]
      end
    end
  end
  if empty == []
    return "No such team found"
  else
    return empty
  end
end

# p player_numbers("Charlotte Hornets",)

def player_stats(name)
  game_hash.find do |team, val|
    val[:players].find do |player|
      if player[:player_name].include?(name)
        return player
      else
        next
      end
    end
  end
  return "No such name found"
end

# puts player_stats("Alan Anderson")

def big_shoe_rebounds
  shoe = 0
  game_hash.each do |team, val|
    val[:players].each do |player|
      if player[:shoe] > shoe
        shoe = player[:shoe]
      else
        next
      end
    end
  end
  
  largest_shoe_rebounds = game_hash.find do |team, val|
    val[:players].find do |player|
      if player[:shoe] == shoe
        return player[:rebounds]
      end
    end
  end
  largest_shoe_rebounds
end
