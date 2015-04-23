require 'spec_helper'

describe Company do
  it { is_expected.to have_db_column(:name).of_type(:string).with_options(null: false) }
  it { is_expected.to have_db_column(:address).of_type(:text).with_options(null: false) }
  it { is_expected.to have_db_column(:city).of_type(:string).with_options(null: false) }
  it { is_expected.to have_db_column(:country).of_type(:string).with_options(null: false) }
  it { is_expected.to have_db_column(:email).of_type(:string) }
  it { is_expected.to have_db_column(:phone).of_type(:string) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:address) }
  it { is_expected.to validate_presence_of(:city) }
  it { is_expected.to validate_presence_of(:country) }
end
