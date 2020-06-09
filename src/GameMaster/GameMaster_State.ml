open Data
open Types
module Scenario = GameMaster_Scenario
module Party = GameMaster_Party

module GlobalData = struct
  type t = { gossips: Belt.Set.String.t; completed_scenarii: Belt.Set.String.t }
end

exception Out_of_scenario

type t = Scenario of Scenario.t * Party.t * GlobalData.t * random_seed
