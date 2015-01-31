require_relative 'samples'

class FaultFile
  attr_reader :file
  
  def initialize(file)
    @file = file
  end

  def simple_def_end_check
    def_count = get_count('def')
    end_count = get_count('end')
    return false if def_count > end_count
  end
  
  def simple_do_end_check
    do_count = get_count('do')
    end_count = get_count('end')
    return false if do_count > end_count
  end
  
  def basic_end_check
    def_count = get_count('def')
    do_count = get_count('do')
    begin_count = get_count('begin')
    class_count = get_count('class')
    module_count = get_count('module')
    while_count = get_count('while')
    until_count = get_count('until')
    unless_count = get_count('unless')
    if_count = get_count('if')
    case_count = get_count('case')

    end_count = get_count('end')
    open_counts = def_count + do_count + begin_count + class_count + module_count + while_count + until_count + if_count
    return false if open_counts > end_count
  end
  
  def bracket_check
    get_count('[') == get_count(']')
  end
  
  def parens_check
    get_count('(') == get_count(')')
  end
  
  def curly_check
    get_count('{') == get_count('}')
  end
  
  def order_op_sign_counts_check 
    bracket_check && parens_check && curly_check
  end
  
  def get_count(string)
    file.scan(string).count
  end
  
  def rogue_period
    if file =~ (/\.(\s|\z|$)|(\s|\A|^)\./)
      file.split("\n").each_with_index do |row, index|
        if indexicus = row =~ (/\.(\s|\z|$)|(\s|\A|^)\./)
          return "ROGUE PERIOD on line #{index + 1}\n- Line Index: #{indexicus}\n- \"#{row[indexicus-5..indexicus+6]}\""
        end
      end
    else
      'No Rogue Periods'
    end
  end
  
  def extra_comma
    if indexicus = file =~ (/,\s*\]/)
      "ROGUE COMMA IN ARRAY\n- Whole String Index: #{indexicus}\n- \"#{file[indexicus-5..indexicus+6]}\""
    elsif indexicus = file =~ (/,\s*\}/)
      "ROGUE COMMA IN HASH\n- Whole String Index: #{indexicus}\n- \"#{file[indexicus-5..indexicus+6]}\""
    else
      'No Rogue Commas'
    end
  end
  
  def indent_finder(row, line_number)
    count = 0
    until row[count] != ' '
      count += 1
    end
  
    unless count % 2
      puts "Non-Even indentation at line #{line_number}"
    end
  
    count / 2
  end

  def proper_indent?(row, line_number, number)
    indent_finder(row, line_number) == number
  end

end

puts extra_comma(rogue_comma_array)
