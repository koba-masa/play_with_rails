# frozen_string_literal: true

class DaimyosController < ApplicationController
  def index
    @daimyos = Daimyo.all
  end
end
