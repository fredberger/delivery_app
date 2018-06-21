# Populate pdv table by importing data from file on root path
unless Pdv.any?
  pdv_file = File.read(File.expand_path('pdv_list.json'))
  pdv_list = JSON(pdv_file)

  pdv_list["pdvs"].each do |pdv|
    Pdv.create(id: pdv["id"], tradingName: pdv["tradingName"], ownerName: pdv["ownerName"], document: pdv["document"], coverageArea: pdv["coverageArea"], address: pdv["address"])
  end
end
