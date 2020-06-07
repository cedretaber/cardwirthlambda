module Skill = Cards_Skill
module Item = Cards_Item
module Beast = Cards_Beast

module Feature = struct
  type no_effect = { weapon: bool; magic: bool }

  type body_type =
    { unholy: bool; undead: bool; automaton: bool; constructure: bool }

  type resist = { ice: bool; fire: bool }

  type weakness = { ice: bool; fire: bool }

  type t =
    { no_effect: no_effect;
      body_type: body_type;
      resist: resist;
      weakness: weakness
    }
end

module Enhance = struct
  type t = { action: int; avoid: int; resist: int; defense: int }
end

module Ability = struct
  type physical =
    { intelligence: int;
      vitality: int;
      dexterity: int;
      mind: int;
      agility: int;
      strength: int
    }

  type mental =
    { aggressive: int; cautious: int; cheerful: int; brave: int; trickish: int }

  type t = { physical: physical; mental: mental; enhance: Enhance.t }
end

module Status = struct
  type mentality = { duration: int; mentality: Data.Casts.Mentality.t }

  type t =
    { mentality: mentality;
      paralyze: int;
      poison: int;
      bind: int;
      silence: int;
      face_up: int;
      anti_magic: int
    }
end

type life = { max: int; current: int }

type property =
  { id: int;
    name: string;
    image: Data.Types.Path.t;
    description: string;
    level: int;
    life: life;
    feature: Feature.t;
    ability: Ability.t;
    status: Status.t;
    enhance: Enhance.t;
    coupons: Data.Casts.Coupon.Set.t
  }

type t =
  { property: property;
    skills: Skill.t array;
    items: Item.t array;
    beasts: Beast.t array
  }
