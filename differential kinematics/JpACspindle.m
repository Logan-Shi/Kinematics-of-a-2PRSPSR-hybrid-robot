function Jp = JpACspindle(eta)
a3 = 10;
a = eta(4);
c = eta(5);
Jp = [1, 0,  0, a3*sin(a)*sin(c), -a3*cos(a)*cos(c);
    0, 1,  0, a3*cos(a)*sin(c),  a3*cos(c)*sin(a);
    0, 0, -1,                0,         a3*sin(c)];
end