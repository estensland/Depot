class HelperFunction

  def self.generate(opts = {})
    self.new(opts).generate_function
  end

  attr_accessor :name, :alias_list, :spacing

  def initialize(opts = {})
    @name  = opts[:name]
    @alias_list = opts[:alias_list] || []
    @spacing = calculate_spacing
  end

  def calculate_spacing
    4
  end

  def generate_function
    <<-eos
# run and tell quoted inputs function runs the alias, but keeps extra arguments locked in as a string, like for git commit

function #{name.downcase}-help(){
  echo "#{name.capitalize} Aliases"
  echo
  #{
    alias_list.map do |alias_key, alias_action|
      "echo \" #{alias_key}     = #{alias_action}\""
    end
  }
  echo
}
    eos
  end
end
