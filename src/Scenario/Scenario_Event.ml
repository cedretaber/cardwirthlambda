open Data
open Types

module Content = Scenario_Events_Content

module Ignitions = struct
type t =
  { number : int
  ; key_codes : Belt.Set.String.t
  }
end

type t = 
  { ignitions : Ignitions.t
  ; lines : (Content.t list) Belt.Map.String.t
  }

let find : start_name -> t -> Content.t option =
  fun start_name {lines} ->
    lines
    |. Belt.Map.String.get (string_of_start_name start_name)
    |. Belt.Option.mapWithDefault None Belt.List.head