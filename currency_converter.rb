require 'pry'

class Currency

  GBP_USD = 0.69

  def initialize amount, denomination = :usd
    @amount = amount
    @denomination = denomination
  end

  def amount
    @amount
  end

  def denomination
    @denomination
  end

  def match other_currency
    @denomination == other_currency.denomination
  end

  def no_match
    puts "The currencys do not match!"
  end

  def times multiply
    Currency.new((amount * multiply), @denomination)
  end

  def plus other_currency
    if match other_currency
      Currency.new((amount + other_currency.amount), @denomination)
    elsif (other_currency.denomination == :gbp) && (@denomination == :usd)
      Currency.new((amount + (other_currency.to(:usd).amount)), @denomination)
    elsif (other_currency.denomination == :usd) && (@denomination == :gbp)
      Currency.new((amount + (other_currency.to(:gbp).amount)), @denomination)
    end
  end

  def minus other_currency
    if match other_currency
      Currency.new((amount - other_currency.amount), @denomination)
    elsif (other_currency.denomination == :gbp) && (@denomination == :usd)
      Currency.new((amount - (other_currency.to(:usd).amount)), @denomination)
    elsif (other_currency.denomination == :usd) && (@denomination == :gbp)
      Currency.new((amount - (other_currency.to(:gbp).amount)), @denomination)
    end
  end

  def + other_currency
    if match other_currency
      Currency.new((amount + other_currency.amount), @denomination)
    elsif (other_currency.denomination == :gbp) && (@denomination == :usd)
      Currency.new((amount + (other_currency.to(:usd).amount)), @denomination)
    elsif (other_currency.denomination == :usd) && (@denomination == :gbp)
      Currency.new((amount + (other_currency.to(:gbp).amount)), @denomination)
    end
  end

  def - other_currency
    if match other_currency
      Currency.new((amount - other_currency.amount), @denomination)
    elsif (other_currency.denomination == :gbp) && (@denomination == :usd)
      Currency.new((amount - (other_currency.to(:usd).amount)), @denomination)
    elsif (other_currency.denomination == :usd) && (@denomination == :gbp)
      Currency.new((amount - (other_currency.to(:gbp).amount)), @denomination)
    end
  end

  def == other_currency
    if match other_currency
      amount == other_currency.amount
    elsif (other_currency.denomination == :gbp) && (@denomination == :usd)
      amount == (other_currency.to(:usd).amount)
    elsif (other_currency.denomination == :usd) && (@denomination == :gbp)
      amount == (other_currency.to(:gbp).amount)
    end
  end

  def to convert_to
    if convert_to == @denomination
      Currency.new(@amount, @denomination)
    elsif convert_to == :usd
      Currency.new((@amount/GBP_USD).round(2), :usd)
    elsif convert_to == :gbp      #made this an elsif to add ability to add in more currency types later on
      Currency.new((@amount*GBP_USD).round(2), :gbp)
    end
  end
end



a = Currency.new(5, :usd)
b = Currency.new(10, :usd)
c = Currency.new(5, :gbp)

binding.pry
