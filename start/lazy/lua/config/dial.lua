local augend = require 'dial.augend'
require 'dial.config'.augends:register_group {
  default = {
    -- augend.constant.alias.Alpha,
    -- augend.constant.alias.alpha,
    augend.constant.alias.de_weekday,
    augend.constant.alias.de_weekday_full,
    augend.constant.new { elements = { '&&', '||', }, word = false, },
    augend.constant.new { elements = { '<', '>', }, },
    augend.constant.new { elements = { '+', '-', }, },
    augend.constant.new { elements = { '*', '/', }, },
    augend.constant.new { elements = { '<=', '>=', }, },
    augend.constant.new { elements = { '==', '!=', }, word = false, },
    augend.constant.new { elements = { '++', '--', }, word = false, },
    augend.constant.new { elements = { '[ ]', '[x]', }, word = false, },
    augend.constant.new { elements = { 'TRUE', 'FALSE', 'NONE', }, },
    augend.constant.new { elements = { 'True', 'False', 'None', }, },
    augend.constant.new { elements = { 'true', 'false', 'nil', }, },
    augend.constant.new { elements = { 'YES', 'NO', }, },
    augend.constant.new { elements = { 'Yes', 'No', }, },
    augend.constant.new { elements = { 'and', 'or', }, },
    augend.constant.new { elements = { 'yes', 'no', }, },
    augend.constant.new { elements = { 'on', 'off', }, },
    augend.constant.new { elements = { 'On', 'Off', }, },
    augend.constant.new { elements = { 'ON', 'OFF', }, },
    augend.constant.new { elements = { '_prev', '_next', }, word = false, },
    augend.constant.new { elements = { 'prev_', 'next_', }, word = false, },
    augend.constant.new { elements = { 'Prev', 'Next', }, word = false, },
    -- c
    augend.constant.new { elements = { '%d', '%s', }, word = false, },
    augend.constant.new { elements = { 'signed', 'unsigned', }, },
    augend.constant.new { elements = { 'u8', 'u16', 'u32', }, },
    augend.constant.new { elements = { 's8', 's16', 's32', }, },
    augend.constant.new { elements = { 'char', 'short', 'int', 'long', }, },
    -- date time
    augend.date.alias['%-d.%-m.'],
    augend.date.alias['%-m/%-d'],
    augend.date.alias['%H:%M'],
    augend.date.alias['%H:%M:%S'],
    augend.date.alias['%Y-%m-%d'],
    augend.date.alias['%Y/%m/%d'],
    augend.date.alias['%Y年%-m月%-d日'],
    augend.date.alias['%d.%m.'],
    augend.date.alias['%d.%m.%Y'],
    augend.date.alias['%d.%m.%y'],
    augend.date.alias['%d/%m/%Y'],
    augend.date.alias['%d/%m/%y'],
    augend.date.alias['%m/%d'],
    augend.date.alias['%m/%d/%Y'],
    augend.date.alias['%m/%d/%y'],
    augend.date.alias['%H:%M'],
    augend.date.alias['%Y-%m-%d'],
    augend.date.alias['%Y/%m/%d'],
    augend.date.alias['%m/%d'],
    augend.integer.alias.binary,
    augend.integer.alias.decimal,
    augend.integer.alias.decimal_int,
    augend.integer.alias.hex,
    augend.integer.alias.octal,
    augend.semver.alias.semver,
  },
}
