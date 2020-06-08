type 'id t =
  { id: 'id;
    name: string;
    image: Data.Types.Path.t;
    description: string;
    scenario: string;
    author: string;
    ability: Data.Skills.Ability.t;
    target: Data.Types.Target.t;
    effect_type: Data.Skills.EffectType.t;
    resist_type: Data.Skills.Resist.t;
    success_rate: int;
    visual_effect: Data.Skills.CardVisual.t;
    enhance: Data.Types.Enhance.t;
    sound_paths: Data.Types.Path.t array;
    key_codes: Data.Types.KeyCode.Set.t;
    premium: Data.Skills.Premium.t;
    use_limit: Data.Types.UseLimit.t;
    materials: Data.Types.Path.t
  }

let equals left right =
  left.name = right.name && left.description = right.description
