function U = LH2Control(hL2,p1,p2,ET_fill_complete,ST_vent_complete,ETTVentState)
% U = LH2Control(hL2,p1,p2)
%	Determines control inputs for given ullage pressures and ET height
% here : (ST) or 1 is trailer (horizontal cylinder)
%        (ET) or 2 is station storage (vertical cylinder)  
%
% E = Transfer Line Valve
% V = vaporizer

% obtain model parameters structure
P = evalin('base','LH2Model');

% inputs determined by fill regime
U.ETVentState = ETTVentState;
if hL2 < 0.05*P.H
	% slow fill
	U.lambdaE = 0.5*(1-ET_fill_complete);
	U.lambdaV = (1-ET_fill_complete)*getVaporizerValveState(P,p1,P.p_ST_slow);
	U.STVentState = getSTVentState(P,p1,P.p_ST_slow);
elseif hL2 < 0.70*P.H
	% fast fill
	U.lambdaE = 1*(1-ET_fill_complete);
	U.lambdaV = (1-ET_fill_complete)*getVaporizerValveState(P,p1,P.p_ST_fast);
	U.STVentState = getSTVentState(P,p1,P.p_ST_fast);
elseif hL2 < 0.85*P.H
	% reduced fast fill
	U.lambdaE = 0.8*(1-ET_fill_complete);
	U.lambdaV = (1-ET_fill_complete)*getVaporizerValveState(P,p1,P.p_ST_slow);
	U.STVentState = ET_fill_complete * (p1 > P.p_ST_final);
else 
% topping
	U.lambdaE = 0.7*(1-ET_fill_complete);
    U.lambdaV = (1-ET_fill_complete) * getVaporizerValveState(P,p1,P.p_ST_slow);
	U.STVentState = ET_fill_complete*(1-ST_vent_complete);
end
if ET_fill_complete>0
    if p2 > P.p_ET_final
    U.ETVentState=1;
    else
    U.ETVentState=0;
    end
end

if ET_fill_complete
    if p1 > P.p_ST_final
        U.STVentState=1;
    else
        U.STVentState=0;
    end
end
end


function state = getSTVentState(P,p1,threshold)
% determine ST vent valve state
if p1 < threshold+0.1*threshold
	% turn off valve
	state = 0;
elseif p1 >threshold-0.1*threshold 
	% turn on valve
	state = 1;

else
	% stays at same value
	state = P.STVentState;
end
end

function state = getETVentState(P,p2)
% determine ET vent valve state
if p2 < P.p_ET_low
	% turn off valve
	state = 0;
elseif p2 > P.p_ET_high
	% turn on valve
	state = 1;
elseif ET_fill_complete > 0
    if p2 > P.p_ET_final
        state = 1;
        U.ETVentState=1;
    else
        state = 0;
        U.ETVentState=0;
    end
else
	% stays at same value
	state = P.ETVentState;
end
end


function state = getVaporizerValveState(P,p1,pSet)
% goal is to provide enough flow to maintain p1 at pSet
% so open depending on pressure difference
if p1<pSet-0.02*pSet
	state = max(0,10*(pSet-p1)/pSet);
	state = min(1,state);
elseif p1>pSet+0.02*pSet
	state = 0;
else
	state = P.VapValveState;
end
end
