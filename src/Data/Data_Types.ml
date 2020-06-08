type scenario_name = string

type author_name = string

type gossip_name = string

type start_name = string

external string_of_start_name: start_name -> string = "%identity"

type area_id = int

type battle_id = int

type package_id = int

type cast_id = int

type skill_id = int

type item_id = int

type beast_id = int

type info_id = int

type is_complete = bool

module Path = struct type t = string end

module Comparison = struct
  type t = Eq | Ne | Lt | Gt

  let compare comp x y =
    match comp with Eq -> x = y | Ne -> x <> y | Lt -> x < y | Gt -> x > y
end

module Enhance = struct
  module Types = struct
    type t =
      | (* 行動 *) Action
      | (* 回避 *) Avoid
      | (* 抵抗 *) Resist
      | (* 防御 *) Defense
  end

  type t = { action: int; avoid: int; resist: int; defense: int }
end

module KeyCode = struct
  type t = string

  module Set = struct type t = string list end
end

module UseLimit = struct type t = int end

module Level = struct
  type t = int

  module Range = struct type t = { max: int; min: int } end
end

module Money = struct type t = int end

module Percent = struct type t = int end

module Decisecond = struct type t = int end

module ActionCard = struct type t = Skill | Item | Beast end

module Target = struct type t = Selected | Unselected | Random | Party end

module BranchTarget = struct type t = { target: Target.t; sleep: bool } end

module Status = struct
  type t =
    | (* 行動可能 *) Active
    | (* 行動不可 *) Inactive
    | (* 生存 *) Alive
    | (* 非生存 *) Dead
    | (* 健康 *) Fine
    | (* 負傷 *) Injured
    | (* 重症 *) HeavyInjured
    | (* 意識不明 *) Unconscious
    | (* 中毒 *) Poison
    | (* 睡眠 *) Sleep
    | (* 呪縛 *) Bind
    | (* 麻痺/石化 *) Paralyze
    | (* 混乱(CardWirth Extender 1.30～) *) Confuse
    | (* 激昂(CardWirth Extender 1.30～) *) Overheat
    | (* 勇敢(CardWirth Extender 1.30～) *) Brave
    | (* 恐慌(CardWirth Extender 1.30～) *) Panic
    | (* 沈黙(CardWirth 1.50) *) Silence
    | (* 暴露(CardWirth 1.50) *) FaceUp
    | (* 魔法無効化(CardWirth 1.50) *) AntiMagic
    | (* 行動力上昇(CardWirth 1.50) *) UpAction
    | (* 回避力上昇(CardWirth 1.50) *) UpAvoid
    | (* 抵抗力上昇(CardWirth 1.50) *) UpResist
    | (* 防御力上昇(CardWirth 1.50) *) UpDefense
    | (* 行動力低下(CardWirth 1.50) *) DownAction
    | (* 回避力低下(CardWirth 1.50) *) DownAvoid
    | (* 抵抗力低下(CardWirth 1.50) *) DownResist
    | (* 防御力低下(CardWirth 1.50) *) DownDefense
    | (* 状態指定無し *) None
end

module Range = struct
  type t =
    | (* 選択中メンバ *) Selected
    | (* 誰か一人 *) Random
    | (* パーティ全員 *) Party
    | (* 荷物袋 *) Backpack
    | (* 全員と荷物袋 *) PartyAndBackpack
    | (* フィールド全体 *) Field
    | (* 称号所有者(Wsn.2) *) CouponHolder
    | (* カードの効果対象(Wsn.2) *) CardTarget
end

module CardTarget = struct
  type t =
    | (* 対象無し *) None
    | (* 使用者 *) User
    | (* 味方 *) Party
    | (* 敵方 *) Enemy
    | (* 双方 *) Both
end

module Transition = struct
  type t =
    | (* ユーザ指定 *) Default
    | (* アニメーション無し *) None
    | (* ブラインド式 *) Blinds
    | (* ピクセルディゾルブ式 *) PixelDissolve
    | (* フェード式 *) Fade
end

module BlendMode = struct
  type t =
    | (* 標準 *) Normal
    | (* 無効 *) Mask
    | (* 加算 *) Add
    | (* 減算 *) Subtract
    | (* 乗算 *) Multiply
end

module GradientDir = struct
  type t =
    | (* グラデーション無し *) None
    | (* 左から右へ *) LeftToRight
    | (* 上から下へ *) TopToBottom
end

module BorderingType = struct
  type t = (* 縁取り無し *) None | (* 外側を縁取り *) Outline | (* 内側を縁取り *) Inline
end

module CoordinateType = struct
  type t =
    | (* 座標指定無効 *) None
    | (* 絶対位置 *) Absolute
    | (* 相対位置 *) Relative
    | (* パーセンテージ *) Percentage
end

(* キャスト同行時の戦闘行動開始タイミング(Wsn.2) *)
module StartAction = struct
  type t =
    | (* 即時に行動する(無指定の場合のデフォルト) *) Now
    | (* ラウンドイベントで加入した場合はそのラウンドから行動する *) CurrentRound
    | (* 次ラウンドから行動する(クラシックなシナリオのデフォルト) *) NextRound
end

(* 背景セルのスムージング設定(Wsn.2)。 *)
module Smoothing = struct
  type t =
    | (* エンジンの設定を使用する *) Default
    | (* 強制的にスムージングする *) True
    | (* 強制的にスムージングしない *) False
end

module Color = struct
  type t = { r: int; g: int; b: int; a: int }

  let black = { r= 0; g= 0; b= 0; a= 255 }

  let white = { r= 255; g= 255; b= 255; a= 255 }

  let red = { r= 255; g= 0; b= 0; a= 255 }

  let green = { r= 0; g= 255; b= 0; a= 255 }

  let blue = { r= 0; g= 0; b= 255; a= 255 }
end

module Font = struct
  type t =
    { name: string;
      size: int;
      strike: bool;
      bold: bool;
      underline: bool;
      italic: bool
    }
end

module CardImagePosition = struct
  type t =
    | (* 指定無し(クラシックな位置に合わせる) *) Default
    | (* 中央寄せ *) Center
    | (* 左上起点 *) TopLeft
end

module MatchingType = struct type t = (* 全てに一致 *) And | (* どれか一つに一致 *) Or end

module SpreadType = struct type t = Auto | Manual end

module Bgm = struct type t = Midi of Path.t | Mp3 of Path.t | Stop end

module Sound = struct type t = Wave of Path.t | Stop end

module Location = struct type t = { left: int; top: int } end

module Size = struct type t = { width: int; height: int } end
