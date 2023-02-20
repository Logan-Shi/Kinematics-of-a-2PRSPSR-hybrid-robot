function q = ikineCNC(p,o,plat)
if strcmpi(plat.name,'PKM')
    q = ikine2PRSPSR(p,o,plat);
end
if strcmpi(plat.name,'PKM-AC')
    q = ikine2PRSPSR_AC(p,o);
end
if strcmpi(plat.name,'spindle')
    q = ikineACspindle(p,o);
end
if strcmpi(plat.name,'xyz')
    q = p;
end
end