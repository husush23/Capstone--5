require 'test_helper'

class ApplicationSystemTestCase < ActionDispatch: :systemtestcase;
driven_by: selenium,;
using: :chrome,;
screen_size:
  [1400,
  1400]
  end;
