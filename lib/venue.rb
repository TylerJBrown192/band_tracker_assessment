class Venue < ActiveRecord::Base
  has_and_belongs_to_many :bands
  before_save(:capitalize_venues)
  validates(:venue_name, :presence => true)

  private

    define_method(:capitalize_venues) do
      self.venue_name=(venue_name().titlecase())
    end
    
end
