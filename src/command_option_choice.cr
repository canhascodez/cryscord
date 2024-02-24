require "./snowflake"

module Cryscord
  alias LocaleHash = Hash(String, String)
  record(CommandOptionChoice,
    name : String, # 1-100 character choice name
    name_localizations = LocaleHash.new, # localized name, mapped by language code
    value : String | Int32 | Int64
  )
end