
require "./snowflake"
require "./command_option"
require "./permission"

module Cryscord
  class Command
    CHAT_INPUT_REGEX = /^[-_\p{L}\p{N}\p{sc=Deva}\p{sc=Thai}]{1,32}$/
    alias LOCALE_DICT = Hash(String, String)
    alias OPTIONS = Array(CommandOption)

    enum Type : Int32
      CHAT_INPUT = 1
      USER = 2
      MESSAGE = 3
    end

    property!(id : Snowflake)
    property?(type : Command::Type)
    property!(application_id : Snowflake)
    property?(guild_id : Snowflake)
    property!(name : String) # 32 characters max
    property?(name_localizations : LOCALE_DICT)
    property!(description : String) # 100 characters max, empty for USER and MESSAGE types
    property?(description_localizations : LOCALE_DICT)
    property?(options : OPTIONS) # CHAT_INPUT type only
    property?(default_member_permissions : Permission)
    property?(dm_permission : Bool)
    property?(default_permission : Bool) # deprecated
    property?(nsfw : Bool)
    property!(version : Snowflake)

    def initialize(
      @id,
      @application_id,
      @name,
      @version,
      @type = Type::CHAT_INPUT,
      @guild_id = nil,
      @name_localizations = LOCALE_DICT.new,
      @description = "",
      @description_localizations = LOCALE_DICT.new,
      @options = OPTIONS.new,
      @default_member_permissions = "",
      @dm_permission = true,
      @default_permission = nil,
      @nsfw = false
    )
    end
  end
end