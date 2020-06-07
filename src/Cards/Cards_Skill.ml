module Property = Cards_Property
module Beast = Cards_Beast

type t =
  { property: Property.t;
    level: Data.Types.Level.t;
    hold: bool;
    motions: Data.Motion.t list;
    beasts: Beast.t array;
    events: Scenario.Event.t list
  }

let equals left right = Property.equals left.property right.property
