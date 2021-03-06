require "administrate/base_dashboard"

class SuccessStoryDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    image: Field::ActiveStorage,
    contributor: Field::String,
    title: Field::String,
    description: Field::Text,
    position: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :image,
    :contributor,
    :title,
    :position,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :image,
    :contributor,
    :title,
    :description,
    :position,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :image,
    :contributor,
    :title,
    :description,
    :position,
  ].freeze

  # Overwrite this method to customize how success stories are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(success_story)
  #   "SuccessStory ##{success_story.id}"
  # end
  def permitted_attributes
    super + [:image => []]
  end
end
