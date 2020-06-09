module Cast = Cards.Cast

module Adventurers = struct
  type position = int

  type state = Exist | Flipped

  type t = (state * Cast.t) array

  let cast (_, cast) = cast
end

module Companion = struct
  type companion_id = int

  type t = Cast.t array
end

module Enemies = struct
  type enemy_id = int

  type t = Cast.t array
end
