module ApplicationHelper
  include ActionView::Helpers::NumberHelper
  def currency(total)
      total *= 0.01
    return number_to_currency(total)
  end

  def rating(rating)
    return number_with_precision(rating, precision: 1)
  end
end
