module ApplicationHelper
  # Return a title on a per-page basis.
  def title
    base_title = "Song of the Moment"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  # Returns a string containing an asterisk if the model’s validators 
  # include a PresenceValidator
  def mark_required(object, attribute)  
    "*" if object.class.validators_on(attribute).map(&:class).include? ActiveModel::Validations::PresenceValidator  
  end
end
