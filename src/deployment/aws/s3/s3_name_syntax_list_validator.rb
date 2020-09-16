require_relative 's3_name_syntax_validator'

module Deployment
  module Aws
    module S3
      class S3NameSyntaxListValidator
        
        def initialize(
          key,
          error_message = nil,
          syntax_validator = S3NameSyntaxValidator.new())

          @key = key
          @error_message = error_message || "Null or Empty"
          @syntax_validator = syntax_validator
        end

        def execute(items)
          missing = []

          (items || []).each do |item|
            value = item[@key]
            error = @syntax_validator.execute(value)
            unless error.nil?
              missing.push(error)
            end
          end
          
          if missing.length>0
            return "#{@error_message} #{missing.join(", ")}"
          end
    
          return nil
        end

      end
    end
  end
end