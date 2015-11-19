class RunAndTell

  def self.base_function
    <<-eos
# run and tell function runs the alias, but says what the real command was

function run_and_tell(){
  echo
  echo Running: $@
  echo
  eval $@
  echo
}
    eos

  end

  def self.generate_alias(opts = {})
    row = self.new(opts)
    if(opts[:single_input])
      row.run_tell_single_input
    else
      row.run_tell_alias
    end
  end


  def initialize(opts = {})
    @alias  = opts[:alias_name]
    @action = opts[:alias_action]
  end

  def run_tell_alias
    "alias #{@alias}=\"run_and_tell #{@action}\""
  end

  def run_tell_single_input
    "alias #{@alias}=\"run_and_tell '#{@action}'\""
  end
end