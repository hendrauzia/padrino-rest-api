shared_examples_for "sideload-passports" do
  it "includes side-load data for passport" do
    expect_json_types('passports.*', {
      id:              :int,
      employee_id:     :int,
      upload_id:       :int,
      upload_file_url: :string,
      created_at:      :date,
      updated_at:      :date
    })
  end
end
