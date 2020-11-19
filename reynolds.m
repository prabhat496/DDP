function reynolds = reynolds(v_air, D_hydrolic, kin_viscosity)
	reynolds = (v_air*D_hydrolic)/kin_viscosity;
end
