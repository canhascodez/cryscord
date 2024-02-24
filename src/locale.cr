module Cryscord
  LOCALES = %w(
    id
    da
    de
    en-GB
    en-US
    es-ES
    fr
    hr
    it
    hu
    nl
    no
    pl
    pt-BR
    ro
    fi
    sv-SE
    vi
    tr
    cs
    el
    bg
    ru
    uk
    hi
    th
    zh-CN
    ja
    zh-TW
    ko
  )
  record(Locale, code : String) do
    def self.valid?(code : String)
      LOCALES.includes?(code)
    end

    def initialize(code : String)
      raise ArgumentError.new("Invalid locale code: #{code}") unless Locale.valid?(code)
      @code = code
    end

    def self.default_locale
      Locale.new("en-US")
    end
  end
end