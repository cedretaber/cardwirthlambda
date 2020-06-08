open Data
open Types
module Area = Scenario_Area
module BackgroundImage = Scenario_BackgroundImage
module Battle = Scenario_Battle
module Event = Scenario_Event
module Package = Scenario_Package

module FieldCard = struct
  type t =
    | Adventurer of int
    | Companion of int
    | MenuCard of int
    | Enemy of int
end

module Summary = struct
  type data_version = int

  type property =
    { name: scenario_name;
      image_paths: Path.t list;
      author: author_name;
      description: string;
      level: Level.Range.t;
      required_coupons: Casts.Coupon.t list;
      start_area_id: area_id;
      tags: string list;
      scenario_type: string
    }

  type t =
    { data_version: data_version;
      property: property;
      flags: Flag.t Belt.Map.String.t;
      steps: Step.t Belt.Map.String.t
    }
end
