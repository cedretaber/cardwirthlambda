module Element = struct
  type t =
    | (* 全 *) All
    | (* 肉体 *) Health
    | (* 精神 *) Mind
    | (* 神聖 *) Miracle
    | (* 魔法 *) Magic
    | (* 炎 *) Fire
    | (* 冷気 *) Ice
end

module DamageType = struct
  type t =
    | (* レベル比 *) LevelRatio
    | (* 値の直接指定 *) Normal
    | (* 最大値 *) Max
    | (* 固定値(Wsn.1) *) Fixed
end

module Motion = struct
  type t =
    | Heal of { value: int; damega_type: DamageType.t }
    | Damage of { value: int; damega_type: DamageType.t }
    | Absorb of { value: int; damega_type: DamageType.t }
    | Paralyze of { value: int; damega_type: DamageType.t }
    | DisParalyze of { value: int; damega_type: DamageType.t }
    | Poison of { value: int; damega_type: DamageType.t }
    | DisPoison of { value: int; damega_type: DamageType.t }
    | GetSkillPower of { value: int; damega_type: DamageType.t }
    | LoseSkillPower of { value: int; damega_type: DamageType.t }
    | Sleep of int
    | Confuse of int
    | Overheat of int
    | Brave of int
    | Panic of int
    | Normal
    | Bind of int
    | DisBind
    | Silence of int
    | DisSilence
    | FaceUp of int
    | FaceDown
    | AntiMagic of int
    | DisAntiMagic
    | EnhanceAction of { value: int; duration: int }
    | EnhanceAvoid of { value: int; duration: int }
    | EnhanceResist of { value: int; duration: int }
    | EnhanceDefense of { value: int; duration: int }
    | VanishTarget
    | VanishCard
    | VanishBeast
    | DealAttackCard
    | DealPowerfulAttackCard
    | DealCriticalAttackCard
    | DealFeintCard
    | DealDefenseCard
    | DealDistanceCard
    | DealConfuseCard
    | DealSkillCard
    | SummonBeast of int
    | CancelAction
    | NoEffect
end

type t = { motion: Motion.t; element: Element.t }
