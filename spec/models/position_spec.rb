require 'spec_helper'

describe Position do
  it { is_expected.to have_db_column(:name).of_type(:string).with_options(null: false) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
end
