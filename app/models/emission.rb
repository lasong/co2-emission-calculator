class Emission < ApplicationRecord
  MAX_FILE_ROW_COUNT = 100_0000

  has_one_attached :file
  has_many :emission_calculations

  validate :validate_row_count, on: :create

  private

  def validate_row_count
    return unless file.attached?

    spreadsheet = Roo::Spreadsheet.open(attachment_changes['file'].attachable)

    # Get the number of rows excluding the header
    row_count = spreadsheet.last_row - 1

    if row_count > MAX_FILE_ROW_COUNT
      errors.add(:file, "contains more than #{MAX_FILE_ROW_COUNT} rows")
    end
  end
end
