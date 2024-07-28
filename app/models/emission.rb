class Emission < ApplicationRecord
  MAX_FILE_ROW_COUNT = 100_000

  has_one_attached :file
  has_many :emission_calculations

  validate :validate_row_count, on: :create

  private

  def validate_row_count
    return unless file.attached?

    file_handler = FileHandler.new(attachment_changes['file'].attachable)

    if file_handler.row_count > MAX_FILE_ROW_COUNT
      errors.add(:file, "contains more than #{MAX_FILE_ROW_COUNT} rows")
    end
  end
end
