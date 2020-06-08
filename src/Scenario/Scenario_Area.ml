open Data.Types
module Event = Scenario_Event

module MenuCard = struct
  type property =
    { name: string;
      path: Path.t;
      description: string;
      flag: string;
      size: Percent.t
    }

  type t = { property: property; events: Event.t list }
end

type property = { id: int; name: string }

type menu_cards = { spread_type: SpreadType.t; cards: MenuCard.t list }

type t =
  { property: property;
    player_card_events: Event.t list;
    menu_cards: menu_cards;
    events: Event.t list
  }
