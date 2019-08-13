%This program generates a simple LIF neuron using following equation:   
%             taw * v_dot = -(v - v_rest) + I_ext,
%
%where I_ext is external input, which is tantamount to sensory stimulus 
%or the activity of neuronal population around. v_rest is the potential 
%of resting state.
%Figure(1) depicts the sub-threshold activity of membrane potential, and
%figure(2) demonstrates the spike train of neuronal activity.


close all; clear all;clc

v_th = -65;
I_ext = 6;
v0 = -70;
dt = .1;
v_rest = -70;
t_f = 50;
taw = 10;

n_tSteps = t_f/dt +1;
V = zeros(n_tSteps,1);
V(1) = v0;
spike_train = zeros(n_tSteps,1);
T = zeros(n_tSteps,1);

for i=1:n_tSteps -1
   
    [v,spk] = LIF_ODE (v_th,v_rest,v0, dt, I_ext,taw);
    T(i+1) = T(i)+dt;
    V(i+1) = v;
    if spk == true
        spike_train(i+1) = 1;
    end
    v0 = v;
end    
    
figure(1);   
plot(T,V)
title('Membrane Potential Dynamics')

figure(2)
plot (T,spike_train)
title('Spike Train')
 









