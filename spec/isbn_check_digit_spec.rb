# frozen_string_literal: true

require_relative '../lib/isbn_check_digit'

describe ISBNCheckDigit do
  describe 'Initialize' do
    context 'ISBN code having an invalid length given' do
      it 'should raise ISBNCheckDigitError' do
        expect { ISBNCheckDigit.new('1234567890123') }.to raise_error(ISBNCheckDigitError)
      end
    end

    context 'ISBN code having non-digit characters given' do
      it 'should raise ISBNCheckDigitError' do
        expect { ISBNCheckDigit.new('12345678901a') }.to raise_error(ISBNCheckDigitError)
      end
    end

    context 'ISBN code having a valid length and all digits given' do
      it 'should not raise ISBNCheckDigitError' do
        expect { ISBNCheckDigit.new('123456789012') }.to_not raise_error
      end
    end

    context 'Should calculate check digit for ISBN code 978014300723' do
      it 'should return 4' do
        isbn_check_digit = ISBNCheckDigit.new('978014300723')
        expect(isbn_check_digit.calc).to eq(4)
      end
    end

    context 'Should return complete ISBN code for ISBN code 978014300723' do
      it 'should return 9780143007234' do
        isbn_check_digit = ISBNCheckDigit.new('978014300723')
        expect(isbn_check_digit.complete_isbn).to eq('9780143007234')
      end
    end
  end
end
