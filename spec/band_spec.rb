require("spec_helper")

describe(Band) do
  it { should have_and_belong_to_many(:venues) }

  it("capitalizes every first letter of the band name before initialization") do
    test_band = Band.create({:band_name => "every time i die"})
    expect(test_band.band_name()).to(eq("Every Time I Die"))
  end

  it("validates the presence of a band name") do
    test_band = Band.new({:band_name => ""})
    expect(test_band.save()).to(eq(false))
  end
end
