# frozen_string_literal: true

# Load high-priority files before endpoint classes
require_relative 'yoksis/base'
require_relative 'yoksis/constants'
require_relative 'yoksis/version'

# Load endpoint classes
require_relative 'yoksis/endpoints/graduates'
require_relative 'yoksis/endpoints/meb'
require_relative 'yoksis/endpoints/references'
require_relative 'yoksis/endpoints/resumes'
require_relative 'yoksis/endpoints/staff'
require_relative 'yoksis/endpoints/students'
require_relative 'yoksis/endpoints/units'
