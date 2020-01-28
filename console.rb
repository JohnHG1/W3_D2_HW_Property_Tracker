require('pry-byebug')
require_relative('models/property_tracker')

PropertyTracker.delete_all()

property1 = PropertyTracker.new({
    "address" => "37 Castle Terrace Edinburgh EH1",
    "value" => "800000",
    "bedrooms" => "3",
    "building" => "semi-detached"
    })
property1.save()

property2 = PropertyTracker.new({
   "address" => "38 Ramsey Gardens Edinburgh EH1",
   "value" => "450000",
   "bedrooms" => "2",
   "building" => "semi-detached"
   })
property2.save()

binding.pry
nil
