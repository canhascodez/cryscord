require "./snowflake"
require "./locale"

module Cryscord
  record(User,
    id : Snowflake,
    username : String,
    discriminator : String,
    global_name : String?,
    avatar : String?,
    bot : Bool?,
    system : Bool?,
    mfa_enabled : Bool?,
    banner : String?,
    accent_color : UInt32?,
    verified : Bool?,
    email : String?,
    flags : UserFlags?,
    premium_type : PremiumType,
    public_flags : UserFlags?,
    avatar_decoration : String?,
    locale : Locale? = Locale.default_locale
  ) do
    @[Flags]
    enum UserFlags
      STAFF
      PARTNER
      HYPESQUAD
      BUG_HUNTER_LEVEL_1
      HYPESQUAD_ONLINE_HOUSE_1 = 1 << 6
      HYPESQUAD_ONLINE_HOUSE_2
      HYPESQUAD_ONLINE_HOUSE_3
      PREMIUM_EARLY_SUPPORTER
      TEAM_PSEUDO_USER
      BUG_HUNTER_LEVEL_2       = 1 << 14
      VERIFIED_BOT             = 1 << 16
      VERIFIED_DEVELOPER
      CERTIFIED_MODERATOR
      BOT_HTTP_INTERACTIONS
      ACTIVE_DEVELOPER         = 1 << 22
    end

    enum PremiumType : UInt8
      None
      NitroClassic
      Nitro
      NitroBasic
    end
  end
end
