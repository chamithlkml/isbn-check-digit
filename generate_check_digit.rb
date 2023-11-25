# frozen_string_literal: true

require_relative 'lib/isbn_check_digit'
require_relative 'lib/isbn_check_digit_error'

begin
  isbn_check_digit = IsbnCheckDigit.new('978014300723')
rescue IsbnCheckDigitError => e
  puts e.message
  puts e.backtrace
end
