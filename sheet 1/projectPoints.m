function [ Plane ] = projectPoints ( World , Intrinsic , Rotation, Translation, varargin ) 
%
%
    ip = inputParser;
    addParameter(ip,'Dist', [0,0,0,0,0]);
    parse(ip, varargin{:});
    var = ip.Results;

    if isequal(var.Dist, [0,0,0,0,0])
        disp('No distortion considered.');
    else
        disp('Radial distortion considered.');
    end
    
    %inverse_Intrinsic = inv(Intrinsic);
    [~,n] = size(World);% introduced n
    Plane = zeros(3,n);
    for i = 1:n
        Plane(:,i) = Intrinsic*[Rotation Translation]*[World(:,i);1]; 
    end
    Plane = Plane./Plane(3,:); % 3rd entry should be one (wasn't), now correctly scaled to [- 320 320] x [-240 240]
    
    normalized_Plane = Intrinsic\Plane; % more robust calculation than using the "inv" function
    % Fixed an issue computing r, forgot the colon for the second dimention
    r = norm(normalized_Plane(1:2,:),2);
    dist_free_Plane = ones(3,n);
    dist_free_Plane(1:2,:) = normalized_Plane(1:2,:) * (1+var.Dist(1)*r^2 + var.Dist(2)*r^4 + var.Dist(5)*r^6);
    
    Plane = (dist_free_Plane' * Intrinsic)'; %transposed the whole equation because of dimensional reasons
 
end



