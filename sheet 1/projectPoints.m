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
    
    Plane = Intrinsic*[Rotation Translation]*[World;ones(1,n)]; 
    
    Plane = Plane./repmat(Plane(3,:),[3,1]); % 3rd entry should be one (wasn't), now correctly scaled to [- 320 320] x [-240 240]
    
    normalized_Plane = Intrinsic\Plane; % more robust calculation than using the "inv" function
    dist_free_Plane = ones(3,n);
    for i = 1:n % iteration to correctly calculate the norm "r" for each world point
    % Fixed an issue computing r, forgot the colon for the second dimension
    r = norm(normalized_Plane(1:2,i),2);
    dist_free_Plane(1:2,i) = normalized_Plane(1:2,i) * (1+var.Dist(1)*r^2 + var.Dist(2)*r^4 + var.Dist(5)*r^6);
    end
    Plane = (dist_free_Plane' * Intrinsic)'; %transposed the whole equation because of dimensional reasons
    
end



