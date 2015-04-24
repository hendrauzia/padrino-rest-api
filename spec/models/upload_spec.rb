require 'spec_helper'

describe Upload do
  it { is_expected.to have_db_column(:file).of_type(:text).with_options(null: false) }
end
