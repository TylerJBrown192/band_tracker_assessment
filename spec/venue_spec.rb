require("spec_helper")

describe(Venue) do
  it { should have_and_belong_to_many(:bands) }

  it("capitalizes every first letter of the venue name before initialization") do
    test_venue = Venue.create({:venue_name => "hawthorne theater"})
    expect(test_venue.venue_name()).to(eq("Hawthorne Theater"))
  end

  it("validates the presence of a venue name") do
    test_venue = Venue.new({:venue_name => ""})
    expect(test_venue.save()).to(eq(false))
  end
end
