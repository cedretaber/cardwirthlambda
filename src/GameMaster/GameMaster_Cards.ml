module Adventurers = struct
  let party_limit = 6

  type position = int

  module CardState = struct
    type t = Exist of Cards.Cast.t | Flipped of Cards.Cast.t

    let cast = function Exist cast -> cast | Flipped cast -> cast
  end

  type t = CardState.t array
end

module Enemies = struct type t = Cards.Cast.t array end
