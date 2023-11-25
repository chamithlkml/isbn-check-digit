# frozen_string_literal: true

require_relative 'isbn_check_digit_error'

# Purpose: Generate ISBN check digit
class ISBNCheckDigit
  def initialize(isbn)
    isbn_s = isbn.to_s

    raise ISBNCheckDigitError, 'ISBN code must be of length 12 digits' unless isbn_s.length == 12

    raise ISBNCheckDigitError, 'ISBN code must be all digits' unless all_digits?(isbn_s)

    @isbn_code = isbn_s[0..11]
  end

  def calc
    isbn_digits_arr = @isbn_code.chars.map(&:to_i)
    sum = 0
    isbn_digits_arr.each_with_index do |digit, index|
      sum += digit * (index.even? ? 1 : 3)
    end

    check_digit = 10 - sum % 10
    check_digit = 0 if check_digit == 10
    check_digit
  end

  def complete_isbn
    "#{@isbn_code}#{calc}"
  end

  private

  def all_digits?(str)
    str.chars.each do |char|
      return false unless char.match?(/[[:digit:]]/)
    end

    true
  end
end
