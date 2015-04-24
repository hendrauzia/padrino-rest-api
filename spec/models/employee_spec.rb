require 'spec_helper'

describe Employee do
  it { is_expected.to have_db_column(:name).of_type(:string).with_options(null: false) }
  it { is_expected.to validate_presence_of(:name) }

  it { is_expected.to belong_to(:company) }
  it { is_expected.to belong_to(:position) }
end
