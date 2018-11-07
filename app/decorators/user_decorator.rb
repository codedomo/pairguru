class UserDecorator < Draper::Decorator
  
  def formatted_creation_date
    object.created_at.to_date.to_formatted_s(:long_ordinal)
  end
end
