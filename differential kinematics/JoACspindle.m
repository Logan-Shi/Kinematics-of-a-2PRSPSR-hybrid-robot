function Jo = JoACspindle(eta)
a = eta(4);
c = eta(5);
Jo = [0, 0,  0, -sin(a)*sin(c), cos(a)*cos(c);
    0, 0,  0, -cos(a)*sin(c),  -cos(c)*sin(a);
    0, 0, 0,                0,         -sin(c)];
end