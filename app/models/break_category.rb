# breakCategory model
class BreakCategory < ApplicationRecord
  has_many :break_sub_categories, dependent: :destroy
  has_many :joins_garages_break_categories

  scope :select_category_sub_category, -> {
    left_joins(:break_sub_categories).select('break_categories.break_category_name,
    break_sub_categories.break_sub_category_name,
    break_sub_categories.price, break_sub_categories.id,
    break_sub_categories.break_category_id')
  }
  scope :select_category, -> { order(break_category_name: :asc) }

  scope :get_category_properties, -> (category_id) {
    joins(:break_sub_categories).select(
      'break_sub_categories.break_sub_category_name, break_sub_categories.id,
      break_categories.break_category_name,
      break_sub_categories.break_category_id').where(
      'break_sub_categories.break_category_id = ?', category_id
    ) }

end
