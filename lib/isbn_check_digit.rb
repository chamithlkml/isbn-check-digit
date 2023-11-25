# frozen_string_literal: true

require_relative 'isbn_check_digit_error'

# Purpose: Generate ISBN check digit
class IsbnCheckDigit
  def initialize(isbn)
    isbn_s = isbn.to_s

    raise IsbnCheckDigitError, 'ISBN code must be of length 12 or 13 digits' unless valid_isbn_length?(isbn_s)

    raise IsbnCheckDigitError, 'ISBN code must be all digits' unless all_digits?(isbn_s)

    @isbn_code = isbn_s[0..11]
    @check_digit = isbn_s[12] # nil if isbn_s.length == 12
  end

  def calc_check_digit
    
  end

  def is_valid?
    
  end

  private

  def valid_isbn_length?(str)
    str.length == 12 || str.length == 13
  end

  def str_to_int_array(str)
    str.chars.map(&:to_i)
  end

  def all_digits?(str)
    str.chars.each do |char|
      return false unless char.match?(/[[:digit:]]/)
    end

    true
  end
end
