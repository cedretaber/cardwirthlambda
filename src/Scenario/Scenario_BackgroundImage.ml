open Data.Types

module Depiction = struct
  type t =
    { transition: Transition.t;
      transition_speed: int;
      doanime: bool;
      ignore_effectbooster: bool
    }

  let make ?(doanime=true) ?(ignore_effectbooster=false) transition transition_speed =
    { transition; transition_speed; doanime; ignore_effectbooster }
end

type property =
  { cellname: string option;
    location: Location.t;
    size: Size.t;
    flag: string option;
    level: int
  }

type t =
  | BackgroundImage of
      { property: property; smoothing: Smoothing.t; mask: bool; path: Path.t }
  | ColorCell of { property: property; blend_mode: BlendMode.t; color: Color.t }
  | TextCell of
      { property: property;
        text: string;
        font: Font.t;
        vertical: bool;
        color: Color.t
      }
  | PCCell of { property: property; smoothing: Smoothing.t; pc_number: int }

let property = function
  | BackgroundImage { property } ->
      property
  | ColorCell { property } ->
      property
  | TextCell { property } ->
      property
  | PCCell { property } ->
      property

let flag image = (property image).flag

let location image = (property image).location

let size image = (property image).size

let has_mask = function BackgroundImage { mask= true } -> true | _ -> false

let is_inherited image =
  match (flag image, has_mask image, location image, size image) with
  (* フラグがある場合は無条件で背景継承 *)
  | Some _, _, _, _ ->
      true (* 透明色が有効な場合は無条件で背景継承 *)
  | None, true, _, _ ->
      true (* 左上に達していない場合は背景継承 *)
  | None, _, { left; top }, _ when left > 0 || top > 0 ->
      true
      (* 画面全体を覆っていない場合は背景継承 *)
      (* そうでない場合、則ち画面全体をフラグを持たない画像が覆っている場合は背景を継承しない *)
  | None, _, { left; top }, { width; height } ->
      width + left < 632 || height + top < 420
