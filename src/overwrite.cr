require "./permission"

module Cryscord
  record(Overwrite,
    id : Int32,
    type : Overwrite::Type,
    allow : Permission,
    deny : Permission
  ) do
    enum Type : UInt8
      Role
      Member
    end
  end
end
