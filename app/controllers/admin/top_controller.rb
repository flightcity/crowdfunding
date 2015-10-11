class Admin::TopController < ApplicationController
  layout 'admin'
  def index
    render action: 'index'
  end
end
