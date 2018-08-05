function loadfonts()
	surface.CreateFont("WaitingFont",{
		font = "Roboto Bk",
		extended = false,
		size = 55,
		weight = 500,
		italic = true
	})
	surface.CreateFont("EventText",{
		font = "Roboto Bk",
		extended = false,
		size = 20,
		weight = 100,
	})
end
loadfonts()