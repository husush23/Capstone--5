env['rails_env'] ||= 'test'
  require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport:


:TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors, with: :threads)
  # Setup all fixtures in test/fixturesrequire_relativerequireclassActiveSupport/* .yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
*/
