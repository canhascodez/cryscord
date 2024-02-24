module Cryscord
  class Snowflake
    getter id : UInt64
    getter(timestamp : UInt64) { (@id >> 22) + 1420070400000  }
    getter(worker_id : UInt64) { (@id & 0x3E0000) >> 17 }
    getter(process_id : UInt64) { (@id & 0x1F000) >> 12 }
    getter(increment : UInt64) { @id & 0xFFF }
    def initialize(@id : UInt64); end
  end
end
