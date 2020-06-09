open Data
open Types
module Adventurers = GameMaster_Cards.Adventurers

module Cast = struct
  type t = Cast of int | Companion of int | Enemy of int
end

type t =
  (* フィールド用 *)
  | Click of int
  | (* 戦闘時の行動開始 *) UseCard of Adventurers.position * ActionCard.t * int
  | (* 戦闘時の対象選択後効果開始 *) Action of Cast.t
  | (* + 効果 *) Effect of { target: Cast.t; actor: Cast.t }
