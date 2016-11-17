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
    
    Plane = Intrinsic*[Rotation Translation]*[World;ones(1,40)];
    
    normalized_Plane = Intrinsic\Plane; % more robust calculation than using the "inv" function
    % Fixed an issue computing r, forgot the colon for the second dimention
    r = norm(normalized_Plane(1:2,:),2);
    dist_free_Plane = normalized_Plane * (1+var.Dist(1)*r^2 + var.Dist(2)*r^4 + var.Dist(5)*r^6);
    
    Plane = dist_free_Plane' * Intrinsic;
end



