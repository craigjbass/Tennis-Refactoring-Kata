defmodule TennisTest do
  use ExUnit.Case

  @test_cases [
    [0, 0, "Love-All", 'player1', 'player2'],
    [1, 1, "Fifteen-All", 'player1', 'player2'],
    [2, 2, "Thirty-All", 'player1', 'player2'],
    [3, 3, "Deuce", 'player1', 'player2'],
    [4, 4, "Deuce", 'player1', 'player2'],

    [1, 0, "Fifteen-Love", 'player1', 'player2'],
    [0, 1, "Love-Fifteen", 'player1', 'player2'],
    [2, 0, "Thirty-Love", 'player1', 'player2'],
    [0, 2, "Love-Thirty", 'player1', 'player2'],
    [3, 0, "Forty-Love", 'player1', 'player2'],
    [0, 3, "Love-Forty", 'player1', 'player2'],
    [4, 0, "Win for player1", 'player1', 'player2'],
    [0, 4, "Win for player2", 'player1', 'player2'],

    [2, 1, "Thirty-Fifteen", 'player1', 'player2'],
    [1, 2, "Fifteen-Thirty", 'player1', 'player2'],
    [3, 1, "Forty-Fifteen", 'player1', 'player2'],
    [1, 3, "Fifteen-Forty", 'player1', 'player2'],
    [4, 1, "Win for player1", 'player1', 'player2'],
    [1, 4, "Win for player2", 'player1', 'player2'],

    [3, 2, "Forty-Thirty", 'player1', 'player2'],
    [2, 3, "Thirty-Forty", 'player1', 'player2'],
    [4, 2, "Win for player1", 'player1', 'player2'],
    [2, 4, "Win for player2", 'player1', 'player2'],

    [4, 3, "Advantage player1", 'player1', 'player2'],
    [3, 4, "Advantage player2", 'player1', 'player2'],
    [5, 4, "Advantage player1", 'player1', 'player2'],
    [4, 5, "Advantage player2", 'player1', 'player2'],
    [15, 14, "Advantage player1", 'player1', 'player2'],
    [14, 15, "Advantage player2", 'player1', 'player2'],

    [6, 4, 'Win for player1', 'player1', 'player2'],
    [4, 6, 'Win for player2', 'player1', 'player2'],
    [16, 14, 'Win for player1', 'player1', 'player2'],
    [14, 16, 'Win for player2', 'player1', 'player2'],

    [6, 4, 'Win for One', 'One', 'player2'],
    [4, 6, 'Win for Two', 'player1', 'Two'],
    [6, 5, 'Advantage One', 'One', 'player2'],
    [5, 6, 'Advantage Two', 'player1', 'Two']
  ]

  def play_game(tennisGame, p1Points, p2Points, p1Name, p2Name) do
    game = tennisGame.(p1Name, p2Name)

    (0..Enum.max([p1Points, p2Points]))
    |> Enum.each(
         fn (i) ->
           if i < p1Points do
             game = TennisGame1.won_point(game, p1Name)
           end
           if i < p2Points do
             game = TennisGame1.won_point(game, p2Name)
           end
         end
       )

    game
  end


  test "TennisGame 1" do
    @test_cases
    |> Enum.each(
         fn (test_case) ->
           [p1Points, p2Points, score, p1Name, p2Name] = test_case
           game = play_game(TennisGame1.makeGame(), p1Points, p2Points, p1Name, p2Name)
           assert score == TennisGame1.score(game)
         end
       )
  end
end
