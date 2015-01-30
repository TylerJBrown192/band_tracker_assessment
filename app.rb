require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + "/lib/*.rb"].each { |file| require file }

get('/') do
  @bands = Band.all()
  erb(:index)
end

post('/') do
  band_name = params.fetch("band_name")
  Band.create({:band_name => band_name})
  redirect('/')
end

get('/band/:id') do
  @band = Band.find(params.fetch("id").to_i())
  @bands = Band.all()
  @venues = Venue.all()
  erb(:band)
end

patch("/band/:id") do
  @bands = Band.all()
  band_id = params.fetch("id").to_i()
  @band = Band.find(band_id)
  venue_ids = params.fetch("venue_ids")
  new_venue = Venue.find(venue_ids)
  @band.venues().push(new_venue)
  @venues = Venue.all()
  url = "/band/" + params.fetch("id")
  redirect(url)
end

get('/band_edit/:id') do
  @band = Band.find(params.fetch("id").to_i())
  erb(:band_edit)
end

patch('/band_edit/:id') do
  @band = Band.find(params.fetch("id").to_i())
  @bands = Band.all()
  new_band = params.fetch("new_band")
  @band.update({:band_name => new_band})
  url = "/"
  redirect(url)
  end

delete('/band_delete/:id') do
  @band = Band.find(params.fetch("id").to_i())
  @band.delete()
  @bands = Band.all
  url = "/"
  redirect(url)
end

get('/venue') do
  @venues = Venue.all()
  erb(:venue)
end

post('/venue') do
  venue_name = params.fetch("venue_name")
  Venue.create({:venue_name => venue_name})
  redirect('/venue')
end
