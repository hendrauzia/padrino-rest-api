require 'spec_helper'

describe Passport do
  it { is_expected.to belong_to(:employee) }
  it { is_expected.to belong_to(:upload) }
end
