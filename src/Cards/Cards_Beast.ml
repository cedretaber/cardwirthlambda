open Data
open Types
module Property = Cards_Property

type t =
  { property: beast_id Property.t;
    motions: Motion.t list;
    beasts: t array;
    events: Scenario.Event.t list
  }

let equals left right = Property.equals left.property right.property
