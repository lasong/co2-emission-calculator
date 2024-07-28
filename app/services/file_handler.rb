class FileHandler
  def initialize(file)
    @spreadsheet = Roo::Spreadsheet.open(file)
  end

  def row_count
    spreadsheet.last_row - 1 # Get the number of rows excluding the header
  end

  def rows
    file_rows = []
    spreadsheet.each_with_index do |row, index|
      next if index.zero?

      file_rows << row
    end
    file_rows
  end

  private

  attr_reader :spreadsheet
end
