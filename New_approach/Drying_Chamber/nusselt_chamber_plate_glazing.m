function nusselt_chamber_plate_glazing = nusselt_chamber_plate_glazing(Ra, Pr)

	num 	= Ra*Pr;
	den	= 0.2+Pr;

	nusselt_chamber_plate_glazing	= 0.18*((num/den)^0.29);
end
