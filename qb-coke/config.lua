Config = {}

Config.Locale = 'en'

Config.Delays = {
	ProcessCoke = 1000 * 1
}

Config.Pricesell = 950

Config.MinPiecesWed = 1



Config.DrugDealerItems = {
	empty_weed_bag = 91
}

Config.LicenseEnable = false -- enable processing licenses? The player will be required to buy a license in order to process drugs. 



Config.GiveBlack = false -- give black money? if disabled it'll give regular cash.

Config.CircleZones = {
	CokeField = {coords = vector3(227.58, 7394.11, 15.46), name = 'blip_PickupCocaleaf', color = 25, sprite = 496, radius = 30.0},
	CokeProcessing = {coords = vector3(1123.4, -1233.0, 16.42), name = 'blip_ProcessCoke', color = 25, sprite = 496, radius = 100.0},
	DrugDealer = {coords = vector3(-37.42, -2686.19, 6.0), name = 'blip_DrugDealer', color = 6, sprite = 378, radius = 25.0},
}
