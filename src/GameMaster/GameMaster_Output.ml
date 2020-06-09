open Data
open Types
module State = GameMaster_State

module ImageType = struct type t = PCNumber of int | File of Path.t | Card end

module Message = struct
  type t =
    { boundarycheck: bool;
      centeringx: bool;
      columns: int;
      text: string;
      selections: (int * string) list
    }
end

module Play = Scenario.Event.Content.Play
module FieldCard = Scenario.FieldCard
module BackgroundImage = Scenario.BackgroundImage

type t' =
  | StartScenario of scenario_name
  | EndScenario of is_complete
  | Gameover
  | MoveArea of area_id
  | StartBattle of battle_id
  | LoadPackage of package_id
  | Message of Message.t (* 画像なしメッセージ *)
  | Dialog of ImageType.t * Message.t (* 画像ありメッセージ *)
  | Wait of Decisecond.t
  | Bgm of Bgm.t * Play.t
  | Sound of Sound.t * Play.t
  | Effect of FieldCard.t * Skills.CardVisual.t * Sound.t
  | Flag of Flag.name * Flag.state
  | Money of Money.t
  | Coupon
  | SelectPlayerCharactor of int list
  | PartyDown
  | PartyUp
  | ChangeBackground of BackgroundImage.t list * BackgroundImage.Depiction.t
  | Break
  | EventEnd
  | None

type t = State.t * t'

let make : State.t -> 't -> t = fun state output -> (state, output)
