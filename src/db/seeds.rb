# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env.development?
  Daimyo.create(
    [
      { name: '織田信長', birthed_on: Date.parse('1534-06-23'), died_on: Date.parse('1582-06-21') },
      { name: '豊臣秀吉', birthed_on: Date.parse('1537-03-17'), died_on: Date.parse('1598-09-18') },
      { name: '徳川家康', birthed_on: Date.parse('1543-01-31'), died_on: Date.parse('1616-06-01') },
    ],
  )
end
