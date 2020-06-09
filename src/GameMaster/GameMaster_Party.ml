open Data
open Types
module Adventurers = GameMaster_Cards.Adventurers

module Goods = struct
  type t =
    | Skill of Cards.Skill.t
    | Item of Cards.Item.t
    | Beast of Cards.Beast.t

  let equals left right =
    match (left, right) with
    | Skill l, Skill r ->
        Cards.Skill.equals l r
    | Item l, Item r ->
        Cards.Item.equals l r
    | Beast l, Beast r ->
        Cards.Beast.equals l r
    | _ ->
        false
end

type t =
  { adventurers: Adventurers.t;
    money: Money.t;
    bag: Goods.t list;
    name: string
  }
