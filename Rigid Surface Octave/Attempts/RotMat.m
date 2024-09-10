%% function
function R = RotMat(axis, rad)
    axis = find(['x', 'y', 'z'] == axis);
    R = ones(3); V = [cos(rad) -sin(rad); sin(rad) cos(rad)];
    R(axis,:) = 0; R(:,axis) = 0; R(logical(R)) = V; R(axis,axis) = 1;
end