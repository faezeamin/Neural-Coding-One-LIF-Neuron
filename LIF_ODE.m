function [v,spk] = LIF_ODE(v_th,v_rest,v0, dt, I, taw)

%v = v0 + dt * (-v0 +I);
v = v0 + (dt / taw) * (-(v0 - v_rest) + I);
spk = false;
if v >= v_th
    v = v_rest;
    spk = true;
end
        
end

