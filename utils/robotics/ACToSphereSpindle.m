function o = ACToSphereSpindle(angles)
number_size = size(angles,1);
o = zeros(number_size,3);
for i = 1:number_size
    alphai = angles(i,1);
    betai = angles(i,2);
    o(i,:) = [-cos(betai)*sin(alphai);
        sin(betai);
        -cos(alphai)*cos(betai)];
    o(i,:) = o(i,:)/norm(o(i,:));
end
end