require "./src/common/validators/json_file_exist"
require "./src/common/validators/validator"

module CommandLine
  class Validator

    def initialize(user_config_validator = Common::Validators::JsonFileExist.new("No user config file defined"))
      @user_config_validator = user_config_validator
    end

    def execute(options)
      validators = [
        lambda { return @user_config_validator.execute(options[:user_config]) }
      ]
      validator = Common::Validators::Validator.new(validators)
      return validator.execute()
    end

  end
end