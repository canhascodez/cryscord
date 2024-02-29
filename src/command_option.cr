require "./command_option_choice"
require "./channel"

module Cryscord
  alias LocaleDict = Hash(String, String)
  alias ParentCommandOptionArray = Array(CommandOption)
  alias ChoiceArray = Array(CommandOptionChoice)
  alias ChannelTypeArray = Array(Channel::Type)

  record(CommandOption,
    type : CommandOption::Type,
    name : String,        # 1-32 character name
    description : String, # 1-100 character description
    name_localizations = LocaleDict.new,
    description_localizations = LocaleDict.new,
    required = false,                       # if the parameter is required or optional--default false
    choices = ChoiceArray.new,              # choices for STRING, INTEGER, and NUMBER types for the user to pick from, max 25
    options = ParentCommandOptionArray.new, # if the option is a subcommand or subcommand group type, this nested options will be the parameters
    channel_types = ChannelTypeArray.new,
    min_value : UInt64? = nil,  # integer for INTEGER, double for NUMBER
    max_value : UInt64? = nil,  # integer for INTEGER, double for NUMBER
    min_length : UInt32? = nil, # min 0, max 6000
    max_length : UInt32? = nil, # min 1, max 6000
    autocomplete = false  ) do
    enum Type : Int32
      SUB_COMMAND       = 1
      SUB_COMMAND_GROUP
      STRING
      INTEGER
      BOOLEAN
      USER
      CHANNEL
      ROLE
      MENTIONABLE
      NUMBER
      ATTACHMENT
    end
  end
end
