shared_examples_for "sideload-employees" do
  it "includes side-load data for employee" do
    expect_json_types('employees.*', {
      id:          :int,
      name:        :string,
      position_id: :int,
      company_id:  :int,
      created_at:  :date,
      updated_at:  :date
    })
  end
end
