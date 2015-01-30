class Band < ActiveRecord::Base
  has_and_belongs_to_many :venues
  before_save(:capitalize_bands)
  validates(:band_name, :presence => true)
  
  private

    define_method(:capitalize_bands) do
      self.band_name=(band_name().titlecase())
    end
end
