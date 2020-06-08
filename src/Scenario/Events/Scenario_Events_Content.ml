open Data
open Types
module BackgroundImage = Scenario_BackgroundImage

module BranchAbility = struct
  type t =
    { level: Level.t;
      target: BranchTarget.t;
      physical: Casts.Physical.t;
      mental: Casts.Mental.t
    }

  let t level target physical mental = { level; target; physical; mental }
end

module BranchKeyCode = struct
  module CardType = struct
    type t =
      | (* 全種類 *) All
      | (* 特殊技能 *) Skill
      | (* アイテム *) Item
      | (* 召喚獣 *) Beast
      | (* 手札(Wsn.2) *) Hand
  end

  type t = { range: Range.t; card_type: CardType.t; key_code: KeyCode.t }

  let t range card_type key_code = { range; card_type; key_code }
end

module BranchRandomSelect = struct
  module CastRange = struct type t = { party: bool; enemy: bool; npc: bool } end

  type t =
    { range: CastRange.t; level: Level.Range.t option; status: Status.t option }

  let t range level status = { range; level; status }
end

module BranchSelect = struct
  module Target = struct type t = Active | Party end

  module Method = struct
    type t =
      | (* 手動で選択 *) Manual
      | (* ランダムで選択 *) Random
      | (* 評価条件で選択(Wsn.1) *)
          Valued of
          { initial: int; coupons: Casts.Coupon.name list }
  end

  type t = { target: Target.t; method_: Method.t }

  let t target method_ = { target; method_ }
end

module Effect = struct
  module SoundSetting = struct
    type t = { path: Path.t; volume: int; loop_count: int }
  end

  module Settings = struct
    type t =
      { effect_type: Skills.EffectType.t;
        level: int;
        visual: Skills.CardVisual.t;
        sound: SoundSetting.t;
        resist_type: Skills.Resist.t;
        success_rate: int
      }
  end

  module Ability = struct type t = { ref: bool; ability: Skills.Ability.t } end

  module Ignite = struct type t = { ignite: bool; coupons: string list } end

  type t =
    { motions: Data.Motion.t list;
      settings: Settings.t;
      ability: Ability.t;
      ignite: Ignite.t
    }
end

module MoveBackgroundImage = struct
  module Position = struct
    type t = { coordinate_type: CoordinateType.t; x: int; y: int }
  end

  module Size = struct
    type t = { coordinate_type: CoordinateType.t; height: int; width: int }
  end

  type t =
    { cellname: string;
      position: Position.t;
      size: Size.t;
      depiction: BackgroundImage.Depiction.t
    }
end

module Play = struct
  type t = { fadein: int; volume: int; channel: int; loop_count: int }
end

module TalkDialog = struct
  module ImageType = struct
    type t = File of Path.t | Selected | Unselected | Random | Card
  end

  module Dialog = struct
    type t = { required_coupons: string list; text: string }
  end

  type t =
    { image: ImageType.t;
      boundarycheck: bool;
      centeringx: bool;
      columns: int;
      dialogs: Dialog.t list
    }

  let make ?(boundarycheck = false) ?(centeringx = false) image columns dialogs
      =
    { image; boundarycheck; centeringx; columns; dialogs }
end

module TalkMessage = struct
  module ImageType = struct
    type t =
      | (* PCの画像 *) PCNumber
      | (* ファイル *) File of Path.t
      | (* 選択中メンバ *) Selected
      | (* 非選択メンバ *) Unselected
      | (* ランダムメンバ *) Random
      | (* カード *) Card
      | (* 評価メンバ *) Valued of (Casts.Coupon.name * int) list
  end

  type t =
    { image: ImageType.t;
      boundarycheck: bool;
      centeringx: bool;
      columns: int;
      text: string
    }

  let make ?(boundarycheck = false) ?(centeringx = false) image columns text =
    { image; boundarycheck; centeringx; columns; text }
end

module RemoveCount = struct type t = All | Count of int end

module SourceFlag = struct type t = Random | From of Flag.name end

module SourceStep = struct
  type t = Random | SelectedPc | From of Step.name
end

type nexts = t list

and texts = (string * t) list

and bools = (bool * t) list

and steps = (Step.state * t) list

and area_ids = (area_id * t) list

and battke_ids = (battle_id * t) list

and trios = (Comparison.t * t) list

and 'a next_content = Nexts of nexts | List of ('a * t) list

and t =
  (* Terminal *)
  | Start of nexts * start_name
  | StartBattle of battle_id
  | End of is_complete
  | EndBadEnd
  | ChangeArea of area_id
  | EffectBreak
  | LinkStart of string
  | LinkPackage of package_id
  (* Standard *)
  | TalkMessage of texts * TalkMessage.t
  | TalkDialog of texts * TalkDialog.t
  | PlayBgm of nexts * Bgm.t * Play.t
  | PlaySound of nexts * Sound.t * Play.t
  | Wait of nexts * Decisecond.t
  | ElaspeTime of nexts
  | Effect of nexts * Effect.t
  | CallStart of nexts * start_name * (* returned *) bool
  | CallPackage of nexts * package_id * (* returned *) bool
  (* Data *)
  | BranchFlag of bools * Flag.name
  | SetFlag of nexts * Flag.name * Flag.state
  | ReverseFlag of nexts * Flag.name
  | SubstituteFlag of nexts * SourceFlag.t * (* target *) Flag.name
  | BranchFlagCmp of bools * Flag.name * Flag.name
  | CheckFlag of nexts * Flag.name
  | BranchStep of bools * Step.name * Step.state
  | SetStep of nexts * Step.name * Step.state
  | SetStepUp of nexts * Step.name
  | SetStepDown of nexts * Step.name
  | SubstituteStep of nexts * SourceStep.t * (* target *) Step.name
  | BranchMultiStep of steps * Step.name
  | BranchStepCmp of trios * Step.name * Step.name
  | CheckStep of nexts * Step.name * Step.state * Comparison.t
  (* Utility *)
  | BranchSelect of bools * BranchSelect.t
  | BranchAbility of bools * BranchAbility.t
  | BranchRandom of bools * Percent.t
  | BranchMultiRandom of nexts (* Wsn.2 *)
  | BranchLevel of bools * Target.t * Level.t
  | BranchStatus of bools * Target.t * Status.t
  | BranchPartyNumber of bools * int
  | BranchArea of bools * area_id
  | BranchBattle of bools * battle_id
  | BranchIsBattle of bools
  | BranchRandomSelect of bools * BranchRandomSelect.t
  | BranchRound of bools * int * Comparison.t
  (* Branch *)
  | BranchCast of bools * cast_id
  | BranchItem of bools * item_id * int * Range.t
  | BranchSkill of bools * skill_id * int * Range.t
  | BranchInfo of bools * info_id
  | BranchBeast of bools * beast_id * int * Range.t
  | BranchMoney of bools * Money.t
  | BranchCoupon of bools * Range.t * MatchingType.t * Casts.Coupon.name list
  | BranchMultiCoupon of texts * Target.t (* Wsn.2 *)
  | BranchCompleteStamp of bools * scenario_name
  | BranchGossip of bools * gossip_name
  | BranchKeyCode of bools * BranchKeyCode.t
  (* Get *)
  | GetCast of nexts * cast_id * StartAction.t
  | GetItem of nexts * item_id * Range.t * int
  | GetSkill of nexts * skill_id * Range.t * int
  | GetInfo of nexts * info_id
  | GetBeast of nexts * beast_id * Range.t * int
  | GetMoney of nexts * Money.t
  | GetCoupon of nexts * Target.t * (* point *) int * Casts.Coupon.name
  | GetCompleteStamp of nexts * scenario_name
  | GetGossip of nexts * gossip_name
  (* Lost *)
  | LoseCast of nexts * cast_id
  | LoseItem of nexts * item_id * Range.t * RemoveCount.t
  | LoseSkill of nexts * skill_id * Range.t * RemoveCount.t
  | LoseInfo of nexts * info_id
  | LoseBeast of nexts * beast_id * Range.t * RemoveCount.t
  | LoseMoney of nexts * Money.t
  | LoseCoupon of nexts * Target.t * Casts.Coupon.name
  | LoseCompleteStamp of nexts * scenario_name
  | LoseGossip of nexts * gossip_name
  (* Visual *)
  | ShowParty of nexts
  | HideParty of nexts
  | ChangeBgImage of
      nexts * (* transition_speed *) int * Transition.t * BackgroundImage.t list
  | MoveBgImage of nexts * MoveBackgroundImage.t
  | ReplaceBgImage of
      nexts
      * BackgroundImage.Depiction.t
      * (* cellname *) string
      * BackgroundImage.t list
  | LoseBgImage of nexts * BackgroundImage.Depiction.t * (* cellname *) string
  | Redisplay of nexts * (* transition_speed *) int * Transition.t
