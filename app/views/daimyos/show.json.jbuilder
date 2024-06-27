# frozen_string_literal: true

json.daimyo do
  json.id @daimyo.id
  json.name @daimyo.name
  json.birthed_on @daimyo.birthed_on.strftime('%Y/%m/%d')
  json.died_on @daimyo.died_on.strftime('%Y/%m/%d')
end
