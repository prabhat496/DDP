function top_loss_coefficient = top_loss_coefficient(T_glazing, T_ambient, sigma, epsilon)

	
	hr_num = sigma*epsilon*((T_glazing^4) - (T_ambient - 7)^4);
	hr_den = (T_glazing - T_ambient);

	hr = hr_num/hr_den;

	top_loss_coefficient = 2.8 + hr;

end
