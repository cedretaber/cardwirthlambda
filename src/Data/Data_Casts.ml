module Coupon = Data_Casts_Coupon

module Mental = struct
  type t =
    | (* 好戦 *) Aggressive
    | (* 平和 *) Unaggressive
    | (* 社交 *) Cheerful
    | (* 内向 *) Uncheerful
    | (* 勇敢 *) Brave
    | (* 臆病 *) Unbrave
    | (* 慎重 *) Cautious
    | (* 大胆 *) Uncautious
    | (* 狡猾 *) Trickish
    | (* 正直 *) Untrickish
end

module Mentality = struct
  type t =
    | (* 好戦 *) Aggressive
    | (* 平和 *) Unaggressive
    | (* 社交 *) Cheerful
    | (* 内向 *) Uncheerful
    | (* 勇敢 *) Brave
    | (* 臆病 *) Unbrave
    | (* 慎重 *) Cautious
    | (* 大胆 *) Uncautious
    | (* 狡猾 *) Trickish
    | (* 正直 *) Untrickish
end

module Physical = struct
  type t =
    | (* 敏捷度 *) Dexterity
    | (* 器用度 *) Agility
    | (* 知力 *) Intelligence
    | (* 膂力 *) Strength
    | (* 生命力 *) Vitality
    | (* 精神力 *) Mind
end
