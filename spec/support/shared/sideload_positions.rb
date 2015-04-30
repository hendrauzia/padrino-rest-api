shared_examples_for "sideload-positions" do
  it "includes side-load data for position" do
    expect_json_types('positions.*', {
      id:         :int,
      name:       :string,
      created_at: :date,
      updated_at: :date
    })
  end
end
