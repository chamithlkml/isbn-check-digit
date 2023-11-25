# frozen_string_literal: true

require_relative 'lib/isbn_check_digit'
require_relative 'lib/isbn_check_digit_error'

begin
  isbn_check_digit = ISBNCheckDigit.new('978014300723')
  puts isbn_check_digit.calc
  puts isbn_check_digit.complete_isbn
rescue ISBNCheckDigitError => e
  puts e.message
  puts e.backtrace
end
