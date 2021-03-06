require "administrate/base_dashboard"

class DonationDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    contact_name: Field::String,
    contact_phone: Field::String,
    source_name: Field::String,
    source_address: Field::String,
    food_type: Field::String,
    quantity: Field::Number,
    available_from: Field::DateTime,
    available_to: Field::DateTime,
    anonymous: Field::Boolean,
    comment: Field::String,
    status: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    facebook_post_id: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :source_name,
    :food_type,
    :quantity,
    :available_from,
    :status,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :contact_name,
    :contact_phone,
    :source_name,
    :source_address,
    :food_type,
    :quantity,
    :available_from,
    :available_to,
    :anonymous,
    :comment,
    :created_at,
    :updated_at,
    :facebook_post_id,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :contact_name,
    :contact_phone,
    :source_name,
    :source_address,
    :food_type,
    :quantity,
    :available_from,
    :available_to,
    :anonymous,
    :comment,
  ].freeze

  # Overwrite this method to customize how donations are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(donation)
    "Felajánlás ##{donation.id}"
  end
end
