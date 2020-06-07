module Property = Cards_Property

type t =
  { property: Property.t;
    motions: Data.Motion.t list;
    beasts: t array;
    events: Scenario.Event.t list
  }

let equals left right = Property.equals left.property right.property
