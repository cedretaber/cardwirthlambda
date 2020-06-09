open Data
open Types
open GameMaster_Cards
open Scenario
module AreaData = Scenario.Area
module Action = GameMaster_Action

module Area = struct
  type t =
    | Area of area_id * AreaData.t
    | Battle of battle_id * Round.t * Enemies.t
end

module GlobalState = struct
  type t =
    { flags: Flag.state Belt.Map.String.t;
      steps: Step.state Belt.Map.String.t;
      infos: Belt.Set.Int.t
    }
end

module Cards = struct
  type t =
    { casts: cast_id Belt.Map.Int.t;
      skills: skill_id Belt.Map.Int.t;
      items: item_id Belt.Map.Int.t;
      beasts: beast_id Belt.Map.Int.t;
      infos: info_id Belt.Map.Int.t
    }
end

module Event = struct
  type t = Content of Event.t * Event.Content.t | Action of Action.t
end

module SelectedCast = struct
  type t = PC of int | Enemy of int | Companion of int | None
end

type t =
  { summary: Summary.t;
    cards: Cards.t;
    (* 以下、可変情報 *)
    current_area: Area.t;
    global_state: GlobalState.t;
    event_stack: Event.t list;
    selected: SelectedCast.t;
    companions: Adventurers.t;
    backgrounds: BackgroundImage.t list;
    bgm: Bgm.t
  }
