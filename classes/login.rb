require_relative 'generator'

class Login < Generator
  SYMBOLS = %W[. _ - # #{""}].freeze
  attr_reader :fn, :ln

  # receives firstname and lastname
  def initialize(fn, ln)
    @fn, @ln = fn.downcase, ln.downcase
    @fn_parts = get_string_parts(@fn)
    @ln_parts = get_string_parts(@ln)
  end

  def generate
    output_list = []

    output_list << @fn << @ln

    SYMBOLS.each do |symbol|
      @fn_parts.each do |fn_part|
        @ln_parts.each do |ln_part|
          output_list << permutate_strings(symbol, fn_part, ln_part)
        end
      end
    end

    output_list = output_list.flatten.uniq
  end

  private

  def get_string_parts(str)
    # get parts of the sting like: #=> n, na, nam, name
    str.size.times.collect{ |i| str.slice(0..i) }
  end

  def permutate_strings(symbol, *args)
    # get all possible array permutations, and join them
    args.permutation.map{ |set| set.join(symbol)}
  end

end