require "./snowflake"
require "./user"
require "./overwrite"

module Cryscord
  alias OverwriteArray = Array(Overwrite)
  alias UserArray = Array(Cryscord::User)
  record(Channel,
    id : Snowflake,
    type : Channel::Type,
    guild_id : Snowflake? = nil,
    position : UInt32? = nil,
    name : String? = "",
    topic : String? = "",
    nsfw = false,
    last_message_id : Snowflake? = nil,
    bitrate : UInt32? = nil,
    user_limit : UInt32? = nil,
    rate_limit_per_user : UInt32? = nil,
    recipients : UserArray = UserArray.new,
    icon : String? = "",
    owner_id : Snowflake? = nil,
    application_id : Snowflake? = nil,
    managed = false,
    parent_id : Snowflake? = nil,
    last_pin_timestamp : String? = ""
  ) do
    enum Type : UInt32
      GUILD_TEXT
      DM
      GUILD_VOICE
      GROUP_DM
      GUILD_CATEGORY
      GUILD_ANNOUNCEMENT
      ANNOUNCEMENT_THREAD = 10
      PUBLIC_THREAD
      PRIVATE_THREAD
      GUILD_STAGE_VOICE
      GUILD_DIRECTORY
      GUILD_FORUM
      GUILD_MEDIA
    end

    def last_pin_timestamp
      return nil if ["", "null"].include?(@last_pin_timestamp)

      Time.parse_iso8601(@last_pin_timestamp)
    end
  end
end
