defmodule TennisGame1 do
  def makeGame() do
    fn player1Name, player2Name ->
      %{
        player1Name: player1Name,
        player2Name: player2Name,
        p1: 0,
        p2: 0
      }
    end
  end

  def won_point(game, playerName) do
    if playerName == game[:player1Name] do
      %{game | :p1 => game[:p1] + 1}
    else
      %{game | :p2 => game[:p2] + 1}
    end
  end

  def score(game) do
    result = ""
    tempScore = 0
    result = cond do
      (game[:p1] == game[:p2]) ->
        ([%{n: 0, s: "Love-All"}, %{n: 1, s: "Fifteen-All"}, %{n: 2, s: "Thirty-All"}]
         |> Enum.find(%{s: "Deuce"}, fn (e) -> e[:n] == game[:p1] end))[:s]
      (game[:p1] >= 4 || game[:p2] >= 4) ->
        cond do
          (game[:p1] - game[:p2]) == 1 ->
            "Advantage #{game[:player1Name]}"
          (game[:p1] - game[:p2]) == -1 ->
            "Advantage #{game[:player2Name]}"
          (game[:p1] - game[:p2]) >= 2 ->
            "Win for #{game[:player1Name]}"
          true ->
            "Win for #{game[:player1Name]}"
        end
      true -> [1..3] |> Enum.each fn(i)

      end
    end

    result
  end
end

defmodule TennisGame2 do
end

defmodule TennisGame3 do
end
