function Nu_pf = Nu_pf(Re, D_hydrolic, Pr, L_collector)
	if (Re<2300)				% Laminar flow
		Nu_pf = 5.4 + ((0.0019)*((Re*Pr*((D_hydrolic)/L_collector))^1.71))/(1+0.00563*((Re*Pr*(D_hydrolic/L_collector))^1.17));

	elseif (Re>=2300 && Re <6000)		% Transition flow
		Nu_pf = (0.116*((Re^(2/3))-125)*(Pr^(1/3)))*(1+((D_hydrolic/L_collector)^(2/3)));
	
	else
		Nu_pf = 0.018*(Re^(0.8))*(Pr^(0.4));

	end
