# frozen_string_literal: true

class NestedTransactionsController < ApplicationController
  def create
    ActiveRecord::Base.transaction do
      Daimyo.create!(
        name: '織田信忠',
        birthed_on: Date.parse('1557-6-21'),
        died_on: Date.parse('1582-6-21'),
      )
      create_duplicate_record
    end
  end

  private

  def create_duplicate_record
    ActiveRecord::Base.transaction do
      Daimyo.create!(
        name: '織田秀信',
        birthed_on: Date.parse('1580-7-13'),
        died_on: Date.parse('1605-7-13'),
      )
      Daimyo.create!(
        name: '織田信忠',
        birthed_on: Date.parse('1557-6-21'),
        died_on: Date.parse('1582-6-21'),
      )
    end
  end
end
