# frozen_string_literal: true

class DaimyosController < ApplicationController
  def index
    @daimyos = Daimyo.all
  end

  def show
    @daimyo = Daimyo.find(params[:id])
  end
end
