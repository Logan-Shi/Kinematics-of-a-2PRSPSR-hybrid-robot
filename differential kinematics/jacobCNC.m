function [Jp,Jo] = jacobCNC(q,p,o,plat)
if strcmpi(plat.name,'PKM')
    Jp = Jp2PRSPSR(q,p,o,plat);
    Jo = Jo2PRSPSR(q,p,o,plat);
%     Jo = skew(o)*Jo;
else
    if strcmpi(plat.name,'spindle')
        Jp = JpACspindle(q);
        Jo = JoACspindle(q);
%         Jo = skew(o)*Jo;
    else
        if strcmpi(plat.name,'test')
            Jp = [q(2) q(1) 0;
                0 1 0;
                0 0 1];
            Jo = [];
        end
end
end