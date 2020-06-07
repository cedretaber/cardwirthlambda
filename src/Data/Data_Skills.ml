module Mental = Data_Casts.Mental
module Physical = Data_Casts.Physical

module Ability = struct type t = { mental: Mental.t; physical: Physical.t } end

module CardVisual = struct
  type t =
    | (* 無し *) None
    | (* 反転 *) Reverse
    | (* 横震動 *) Horizontal
    | (* 縦振動 *) Vertical
end

module EffectType = struct
  type effect_type =
    | (* 物理 *) Physic
    | (* 魔法 *) Magic
    | (* 魔法的物理 *) MagicalPhysic
    | (* 物理的魔法 *) PhysicalMagic
    | (* 無 *) None

  type t = { t: effect_type; spell: bool }
end

module Premium = struct
  type t = (* 日用品 *) Normal | (* 希少品 *) Rare | (* 貴重品 *) Premium
end

module Resist = struct
  type t = (* 回避 *) Avoid | (* 抵抗 *) Resist | (* 必中 *) Unfail
end
