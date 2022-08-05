class Form::Base
  include ActiveModel::Model
  include ActiveModel::Callbacks
  include ActiveModel::Validations
  include ActiveModel::Validations::Callbacks
  
  # def value_to_boolean(value)
  #   ActiveRecord::Type::Boolean.new.cast(value)
  # end
end