# frozen_string_literal: true

Dir[File.join(__dir__, File.basename(__FILE__, '.*'), '*.rb')].each do |path|
  require path
end
