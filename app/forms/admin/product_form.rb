class Admin::ProductForm
  include ActiveModel::Model

  attr_accessor :title, :body, :target_price, :current_price, :start_datetime, :end_datetime
end