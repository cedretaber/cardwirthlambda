module Path = struct type t = string end

module Target = struct type t = Selected | Unselected | Random | Party end

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
