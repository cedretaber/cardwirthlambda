type name = string

type t = { name: name; value: int }

module Set = struct
  module Map = Belt.Map.String

  type map = name Map.t

  type t =
    { normals: map;
      concealeds: map;
      periods: map;
      battles: map;
      systems: map;
      list: string list
    }

  let empty =
    { normals= Map.empty;
      concealeds= Map.empty;
      periods= Map.empty;
      battles= Map.empty;
      systems= Map.empty;
      list= []
    }
end
