# encoding: utf-8
require 'money/currency'
require 'money/bank/variable_exchange'

# Represents an amount of money in a given currency.
class Money
  include Comparable

  # The value of the money is cents.
  #
  # @return [Integer]
  attr_reader :cents

  # The currency the money is in.
  #
  # @return [Currency]
  attr_reader :currency

  # The +Money::Bank+ based object used to perform currency exchanges with.
  #
  # @return [Money::Bank::*]
  attr_reader :bank

  # Class Methods
  class << self
    # Each Money object is associated to a bank object, which is responsible
    # for currency exchange. This property allows you to specify the default
    # bank object. The default value for this property is an instance if
    # +Bank::VariableExchange.+ It allows one to specify custom exchange rates.
    #
    # @return [Money::Bank::*]
    attr_accessor :default_bank

    # The default currency, which is used when +Money.new+ is called without an
    # explicit currency argument. The default value is Currency.new("USD"). The
    # value must be a valid +Money::Currency+ instance.
    #
    # @return [Money::Currency]
    attr_accessor :default_currency
  end

  # Set the default bank for creating new +Money+ objects.
  self.default_bank = Bank::VariableExchange.instance

  # Set the default currency for creating new +Money+ object.
  self.default_currency = Currency.new("USD")

  # Create a new money object with value 0.
  #
  # @param [Currency, String, Symbol] currency The currency to use.
  #
  # @return [Money]
  #
  # @example
  #   Money.empty #=> #<Money @cents=0>
  def self.empty(currency = default_currency)
    Money.new(0, currency)
  end

  # Creates a new Money object of the given value, using the Canadian
  # dollar currency.
  #
  # @param [Integer] cents The cents value.
  #
  # @return [Money]
  #
  # @example
  #   n = Money.ca_dollar(100)
  #   n.cents    #=> 100
  #   n.currency #=> #<Money::Currency id: cad>
  def self.ca_dollar(cents)
    Money.new(cents, "CAD")
  end

  # Creates a new Money object of the given value, using the American dollar
  # currency.
  #
  # @param [Integer] cents The cents value.
  #
  # @return [Money]
  #
  # @example
  #   n = Money.us_dollar(100)
  #   n.cents    #=> 100
  #   n.currency #=> #<Money::Currency id: usd>
  def self.us_dollar(cents)
    Money.new(cents, "USD")
  end

  # Creates a new Money object of the given value, using the Euro currency.
  #
  # @param [Integer] cents The cents value.
  #
  # @return [Money]
  #
  # @example
  #   n = Money.euro(100)
  #   n.cents    #=> 100
  #   n.currency #=> #<Money::Currency id: eur>
  def self.euro(cents)
    Money.new(cents, "EUR")
  end

  # Adds a new exchange rate to the default bank and return the rate.
  #
  # @param [Currency, String, Symbol] from_currency Currency to exchange from.
  # @param [Currency, String, Symbol[ to_currency Currency to exchange to.
  # @param [Numeric] rate Rate to exchange with.
  #
  # @return [Numeric]
  #
  # @example
  #   Money.add_rate("USD", "CAD", 1.25) #=> 1.25
  def self.add_rate(from_currency, to_currency, rate)
    Money.default_bank.add_rate(from_currency, to_currency, rate)
  end

  # Creates a new money object. Alternatively you can use the convenience
  # methods like +Money#ca_dollar+ and +Money#us_dollar+
  #
  # @param [Integer] cents The cents value.
  # @param [optional, Currency, String, Symbol] currency The currency format.
  # @param [optional, Money::Bank::*] bank The exchange bank to use.
  #
  # @return [Money]
  #
  # @example
  #  Money.new(100) #=> #<Money @cents=100>
  def initialize(cents, currency = Money.default_currency,
                 bank = Money.default_bank)
    @cents = cents.round
    if currency.is_a?(Hash)
      # Earlier versions of Money wrongly documented the constructor as being able
      # to accept something like this:
      #
      #   Money.new(50, :currency => "USD")
      #
      # We retain compatibility here.
      @currency = Currency.wrap(currency[:currency] || Money.default_currency)
    else
      @currency = Currency.wrap(currency)
    end
    @bank = bank
  end

  # Return string representation of currency object
  #
  # @return [String]
  #
  # @example
  #   Money.new(100, :USD).currency_as_string #=> "USD"
  def currency_as_string
    self.currency.to_s
  end

  # Set currency object using a string
  #
  # @param [String] val The currency string.
  #
  # @return [Money::Currency]
  #
  # @example
  #   Money.new(100).currency_as_string("CAD") #=> #<Money::Currency id: cad>
  def currency_as_string=(val)
    @currency = Currency.wrap(val)
  end

  # Checks whether two money objects have the same currency and the same
  # amount. Checks against money objects with a different currency and checks
  # against objects that do not respond to #to_money will always return false.
  #
  # @param [Money] other_money Value to compare with.
  #
  # @return [Boolean]
  #
  # @example
  #   Money.new(100) == Money.new(101) #=> false
  #   Money.new(100) == Money.new(100) #=> true
  def ==(other_money)
    if other_money.respond_to?(:to_money)
      other_money = other_money.to_money
      cents == other_money.cents && self.currency == other_money.currency
    else
      false
    end
  end

  # Synonymous with +#==+.
  #
  # @param [Money] other_money Value to compare with.
  #
  # @return [Money]
  #
  # @see #==
  def eql?(other_money)
    self == other_money
  end

  # Returns a Fixnum hash value based on the +cents+ and +currency+ attributes
  # in order to use functions like & (intersection), group_by, etc.
  #
  # @return [Fixnum]
  #
  # @example
  #   Money.new(100).hash #=> 908351
  def hash
    [cents.hash, currency.hash].hash
  end

  # Compares this money object against another object. +other_money+ must
  # respond to #to_money. Returns -1 when less than, 0 when equal and 1 when
  # greater than.
  #
  # If +other_money+ is a different currency, then +other_money+ will first be
  # converted into this money object's currency by calling +#exchange+ on
  # +other_money+.
  #
  # Comparisons against objects that do not respond to #to_money will cause an
  # +ArgumentError+ to be raised.
  #
  # @param [Money, #to_money] other_money Value to compare with.
  #
  # @return [-1, 0, 1]
  #
  # @raise +ArgumentError+
  #
  # @example
  #   Money.new(100) <=> 99             #=>  1
  #   Money.new(100) <=> Money.new(100) #=>  0
  #   Money.new(100) <=> "$101.00"      #=> -1
  def <=>(other_money)
    if other_money.respond_to?(:to_money)
      other_money = other_money.to_money
      if self.currency == other_money.currency
        cents <=> other_money.cents
      else
        cents <=> other_money.exchange_to(currency).cents
      end
    else
      raise ArgumentError, "comparison of #{self.class} with #{other_money.inspect} failed"
    end
  end

  # Returns a new Money object containing the sum of the two operands' monetary
  # values. If +other_money+ has a different currency then its monetary value
  # is automatically exchanged to this object's currency using +exchange_to+.
  #
  # @param [Money] other_money Other +Money+ object to add.
  #
  # @return [Money]
  #
  # @example
  #   Money.new(100) + Money.new(100) #=> #<Money @cents=200>
  def +(other_money)
    if currency == other_money.currency
      Money.new(cents + other_money.cents, other_money.currency)
    else
      Money.new(cents + other_money.exchange_to(currency).cents, currency)
    end
  end

  # Returns a new Money object containing the difference between the two
  # operands' monetary values. If +other_money+ has a different currency then
  # its monetary value is automatically exchanged to this object's currency
  # using +exchange_to+.
  #
  # @param [Money] other_money Other +Money+ object to subtract.
  #
  # @return [Money]
  #
  # @example
  #   Money.new(100) - Money.new(99) #=> #<Money @cents=1>
  def -(other_money)
    if currency == other_money.currency
      Money.new(cents - other_money.cents, other_money.currency)
    else
      Money.new(cents - other_money.exchange_to(currency).cents, currency)
    end
  end

  # Multiplies the monetary value with the given number and returns a new
  # +Money+ object with this monetary value and the same currency.
  #
  # Multiplying with another Money object is currently not supported.
  #
  # @param [Fixnum] fixnum Number to multiply by.
  #
  # @return [Money]
  #
  # @example
  #   Money.new(100) * 2 #=> #<Money @cents=200>
  def *(fixnum)
    Money.new(cents * fixnum, currency)
  end

  # Divides the monetary value with the given number and returns a new +Money+
  # object with this monetary value and the same currency. Can also divide by
  # another +Money+ object to get a ratio. +Money/Numeric+ returns +Money+.
  # +Money/Money+ returns +Float+
  #
  # @param [Money, Numeric] val Number to divide by.
  #
  # @return [Money, Float]
  #
  # @example
  #   Money.new(100) / 10            #=> #<Money @cents=10>
  #   Money.new(100) / Money.new(10) #=> 10.0
  def /(val)
    if val.is_a?(Money)
      if currency == val.currency
        cents / val.cents.to_f
      else
        cents / val.exchange_to(currency).cents.to_f
      end
    else
      Money.new(cents / val, currency)
    end
  end

  # Synonym for +#/+.
  #
  # @param [Money, Numeric] val Number to divide by.
  #
  # @return [Money, Float]
  #
  # @see #/
  def div(val)
    self / val
  end

  # Divide money by money or fixnum and return array containing quotient and
  # modulus.
  #
  # @param [Money, Fixnum] val Number to divmod by.
  #
  # @return [Array<Money,Money>,Array<Fixnum,Money>]
  #
  # @example
  #   Money.new(100).divmod(9)            #=> [#<Money @cents=11>, #<Money @cents=1>]
  #   Money.new(100).divmod(Money.new(9)) #=> [11, #<Money @cents=1>]
  def divmod(val)
    if val.is_a?(Money)
      a = self.cents
      b = self.currency == val.currency ? val.cents : val.exchange_to(self.currency).cents
      q, m = a.divmod(b)
      return [q, Money.new(m, self.currency)]
    else
      return [self.div(val), Money.new(self.cents.modulo(val), self.currency)]
    end
  end

  # Equivalent to +self.divmod(val)[1]+
  #
  # @param [Money, Fixnum] val Number take modulo with.
  #
  # @return [Money]
  #
  # @example
  #   Money.new(100).modulo(9)            #=> #<Money @cents=1>
  #   Money.new(100).modulo(Money.new(9)) #=> #<Money @cents=1>
  def modulo(val)
    self.divmod(val)[1]
  end

  # Synonym for +#modulo+.
  #
  # @param [Money, Fixnum] val Number take modulo with.
  #
  # @return [Money]
  #
  # @see #modulo
  def %(val)
    self.modulo(val)
  end

  # If different signs +self.modulo(val) - val+ otherwise +self.modulo(val)+
  #
  # @param [Money, Fixnum] val Number to rake remainder with.
  #
  # @return [Money]
  #
  # @example
  #   Money.new(100).remainder(9) #=> #<Money @cents=1>
  def remainder(val)
    a, b = self, val
    b = b.exchange_to(a.currency) if b.is_a?(Money) and a.currency != b.currency

    a_sign, b_sign = :pos, :pos
    a_sign = :neg if a.cents < 0
    b_sign = :neg if (b.is_a?(Money) and b.cents < 0) or (b < 0)

    return a.modulo(b) if a_sign == b_sign
    a.modulo(b) - (b.is_a?(Money) ? b : Money.new(b, a.currency))
  end

  # Return absolute value of self as a new Money object.
  #
  # @return [Money]
  #
  # @example
  #   Money.new(-100).abs #=> #<Money @cents=100>
  def abs
    Money.new(self.cents.abs, self.currency)
  end

  # Test if the money amount is zero.
  #
  # @return [Boolean]
  #
  # @example
  #   Money.new(100).zero? #=> false
  #   Money.new(0).zero?   #=> true
  def zero?
    cents == 0
  end

  # Test if the money amount is non-zero. Returns this money object if it is
  # non-zero, or nil otherwise, like +Numeric#nonzero?+.
  #
  # @return [Money, nil]
  #
  # @example
  #   Money.new(100).nonzero? #=> #<Money @cents=100>
  #   Money.new(0).nonzero?   #=> nil
  def nonzero?
    cents != 0 ? self : nil
  end

  # Uses +Currency#symbol+. If +nil+ is returned, defaults to "¤".
  #
  # @return [String]
  #
  # @example
  #   Money.new(100, "USD").symbol #=> "$"
  def symbol
    currency.symbol || "¤"
  end

  # Uses +Currency#delimiter+. If +nil+ is returned, default to ",".
  #
  # @return [String]
  #
  # @example
  #   Money.new(100, "USD").delimiter #=> ","
  def delimiter
    currency.delimiter || ","
  end

  # Uses +Currency#separator+. If +nil+ is returned, default to ".".
  #
  # @return [String]
  #
  # @example
  #   Money.new(100, "USD").separator #=> "."
  def separator
    currency.separator || "."
  end

  # Creates a formatted price string according to several rules.
  #
  # @param [Hash] *rules The options used to format the string.
  #
  # @return [String]
  #
  # @option *rules [Boolean, String] :display_free (false) Whether a zero
  #  amount of money should be formatted of "free" or as the supplied string.
  #
  # @example
  #   Money.us_dollar(0).format(:display_free => true)     #=> "free"
  #   Money.us_dollar(0).format(:display_free => "gratis") #=> "gratis"
  #   Money.us_dollar(0).format                            #=> "$0.00"
  #
  # @option *rules [Boolean] :with_currency (false) Whether the currency name
  #  should be appended to the result string.
  #
  # @example
  #   Money.ca_dollar(100).format => "$1.00"
  #   Money.ca_dollar(100).format(:with_currency => true) #=> "$1.00 CAD"
  #   Money.us_dollar(85).format(:with_currency => true)  #=> "$0.85 USD"
  #
  # @option *rules [Boolean] :no_cents (false) Whether cents should be omitted.
  #
  # @example
  #   Money.ca_dollar(100).format(:no_cents => true) #=> "$1"
  #   Money.ca_dollar(599).format(:no_cents => true) #=> "$5"
  #
  # @option *rules [Boolean, String, nil] :symbol (true) Whether a money symbol
  #  should be prepended to the result string. The default is true. This method
  #  attempts to pick a symbol that's suitable for the given currency.
  #
  # @example
  #   Money.new(100, "USD") #=> "$1.00"
  #   Money.new(100, "GBP") #=> "£1.00"
  #   Money.new(100, "EUR") #=> "€1.00"
  #
  #   # Same thing.
  #   Money.new(100, "USD").format(:symbol => true) #=> "$1.00"
  #   Money.new(100, "GBP").format(:symbol => true) #=> "£1.00"
  #   Money.new(100, "EUR").format(:symbol => true) #=> "€1.00"
  #
  #   # You can specify a false expression or an empty string to disable
  #   # prepending a money symbol.
  #   Money.new(100, "USD").format(:symbol => false) #=> "1.00"
  #   Money.new(100, "GBP").format(:symbol => nil)   #=> "1.00"
  #   Money.new(100, "EUR").format(:symbol => "")    #=> "1.00"
  #
  #   # If the symbol for the given currency isn't known, then it will default
  #   # to "¤" as symbol.
  #   Money.new(100, "AWG").format(:symbol => true) #=> "¤1.00"
  #
  #   # You can specify a string as value to enforce using a particular symbol.
  #   Money.new(100, "AWG").format(:symbol => "ƒ") #=> "ƒ1.00"
  #
  # @option *rules [Boolean, String, nil] :separator (true) Whether the
  #  currency should be separated by the specified character or '.'
  #
  # @example
  #   # If a string is specified, it's value is used.
  #   Money.new(100, "USD").format(:separator => ",") #=> "$1,00"
  #
  #   # If the separator for a given currency isn't known, then it will default
  #   # to "." as separator.
  #   Money.new(100, "FOO").format #=> "$1.00"
  #
  # @option *rules [Boolean, String, nil] :delimiter (true) Whether the
  #  currency should be delimited by the specified character or ','
  #
  # @example
  #   # If false is specified, no delimiter is used.
  #   Money.new(100000, "USD").format(:delimiter => false) #=> "1000.00"
  #   Money.new(100000, "USD").format(:delimiter => nil)   #=> "1000.00"
  #   Money.new(100000, "USD").format(:delimiter => "")    #=> "1000.00"
  #
  #   # If a string is specified, it's value is used.
  #   Money.new(100000, "USD").format(:delimiter => ".") #=> "$1.000.00"
  #
  #   # If the delimiter for a given currency isn't known, then it will default
  #   # to "," as delimiter.
  #   Money.new(100000, "FOO").format #=> "$1,000.00"
  #
  # @option *rules [Boolean] :html (false) Whether the currency should be
  #  HTML-formatted. Only useful in combination with +:with_currency+.
  #
  # @example
  #   s = Money.ca_dollar(570).format(:html => true, :with_currency => true)
  #   s #=>  "$5.70 <span class=\"currency\">CAD</span>"
  def format(*rules)
    # support for old format parameters
    rules = normalize_formatting_rules(rules)

    if cents == 0
      if rules[:display_free].respond_to?(:to_str)
        return rules[:display_free]
      elsif rules[:display_free]
        return "free"
      end
    end

    if rules.has_key?(:symbol)
      if rules[:symbol] === true
        symbol_value = symbol
      elsif rules[:symbol]
        symbol_value = rules[:symbol]
      else
        symbol_value = ""
      end
    else
      symbol_value = symbol
    end

    if rules[:no_cents] or currency.subunit_to_unit == 1
      formatted = sprintf("#{symbol_value}%d", cents.to_f / currency.subunit_to_unit)
    else
      formatted = sprintf("#{symbol_value}%.2f", cents.to_f / currency.subunit_to_unit)
    end

    delimiter_value = delimiter
    # Determine delimiter
    if rules.has_key?(:delimiter)
      if rules[:delimiter] === false or rules[:delimiter].nil?
        delimiter_value = ""
      elsif rules[:delimiter]
        delimiter_value = rules[:delimiter]
      end
    end

    # Apply delimiter
    formatted.gsub!(/(\d)(?=\d{3}+(?:\.|$))(\d{3}\..*)?/, "\\1#{delimiter_value}\\2")

    separator_value = separator
    # Determine separator
    if rules.has_key?(:separator) and rules[:separator]
      separator_value = rules[:separator]
    end

    # Apply separator
    formatted.sub!(/\.(\d{2})$/, "#{separator_value}\\1")

    if rules[:with_currency]
      formatted << " "
      formatted << '<span class="currency">' if rules[:html]
      formatted << currency.to_s
      formatted << '</span>' if rules[:html]
    end
    formatted
  end

  # Returns the amount of money as a string.
  #
  # @return [String]
  #
  # @example
  #   Money.ca_dollar(100).to_s #=> "1.00"
  def to_s
    return sprintf("%d", cents) if currency.subunit_to_unit == 1
    sprintf("%.2f", cents.to_f / currency.subunit_to_unit)
  end

  # Return the amount of money as a float. Floating points cannot guarantee
  # precision. Therefore, this function should only be used when you no longer
  # need to represent currency or working with another system that requires
  # decimals.
  #
  # @return [Float]
  #
  # @example
  #   Money.us_dollar(100).to_f => 1.0
  def to_f
    cents.to_f / currency.subunit_to_unit
  end

  # Receive the amount of this money object in another Currency.
  #
  # @param [Currency, String, Symbol] other_currency Currency to exchange to.
  #
  # @return [Money]
  #
  # @example
  #   Money.new(2000, "USD").exchange_to("EUR")
  #   Money.new(2000, "USD").exchange_to(Currency.new("EUR"))
  def exchange_to(other_currency)
    other_currency = Currency.wrap(other_currency)
    @bank.exchange_with(self, other_currency)
  end

  # Receive a money object with the same amount as the current Money object
  # in american dollars.
  #
  # @return [Money]
  #
  # @example
  #   n = Money.new(100, "CAD").as_us_dollar
  #   n.currency #=> #<Money::Currency id: usd>
  def as_us_dollar
    exchange_to("USD")
  end

  # Receive a money object with the same amount as the current Money object
  # in canadian dollar.
  #
  # @return [Money]
  #
  # @example
  #   n = Money.new(100, "USD").as_ca_dollar
  #   n.currency #=> #<Money::Currency id: cad>
  def as_ca_dollar
    exchange_to("CAD")
  end

  # Receive a money object with the same amount as the current Money object
  # in euro.
  #
  # @return [Money]
  #
  # @example
  #   n = Money.new(100, "USD").as_euro
  #   n.currency #=> #<Money::Currency id: eur>
  def as_euro
    exchange_to("EUR")
  end

  # Conversation to +self+.
  #
  # @return [self]
  def to_money
    self
  end

  private

  # Cleans up formatting rules.
  #
  # @param [Hash]
  #
  # @return [Hash]
  def normalize_formatting_rules(rules)
    if rules.size == 1
      rules = rules.pop
      rules = { rules => true } if rules.is_a?(Symbol)
    else
      rules = rules.inject({}) do |h,s|
        h[s] = true
        h
      end
    end
    rules
  end
end
