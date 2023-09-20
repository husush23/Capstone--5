class ApplicationJob < ActiveJob:
  :Base
  # Automatically retry jobs that encountered a deadlock
  # retry_on;
ApplicationJobActiveJob activerecord:
  :Deadlocked
  # Most jobs are safe to ignore if the underlying records are no longer available
  # discard_on;
activejob:
  :deserializationerror
  end;
