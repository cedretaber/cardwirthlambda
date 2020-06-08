open Data
open Types
module Property = Cards_Property
module Beast = Cards_Beast

type t =
  { property: item_id Property.t;
    price: Money.t;
    enhance_owner: Enhance.t;
    hold: bool;
    motions: Motion.t list;
    beasts: Beast.t array;
    events: Scenario.Event.t list
  }

let equals left right = Property.equals left.property right.property
