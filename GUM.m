function [ v2 ] = GUM( x1 )
    [ m, n, k ] = size( x1 );
    x = x1;
    mask = ( 1 / 25 ) * ones( 5, 5 );
    
    y1 = conv2( x, double( mask ), 'same' );
    d = x - y1;
    g = 3 .* d;
    v1 = y1 + g;
    

    % median filtering
    y2 = medfilt2( x, [ 7, 7 ] );
    
    % X = (1-x)/x
    X = ( 1 - x ) ./ max( x, 0.01 );
    Y = ( 1 - y2 ) ./ max( y2, 0.01 );
    I = ones( m, n );
    
    % d = x - y1
    d1 = I ./ ( 1 + ( X ./ Y ) );
%     imshow(d1);
%     title('d');
    
    % contrast enhancement z 
    h = adapthisteq( y2, 'clipLimit', 0.005 );
%     figure, imshow(h), title('z');
    
    
    c = ( 2 .* d1 ) - 1;
    Gmax = 3;Gmin = 1;eta = 0.5;
    beta = ( Gmax - Gmin ) / ( 1 - exp(  - 1 ) );
    alpha = ( Gmax - beta );
    gama = alpha + ( beta * exp(  - 1 .* abs( c ) .^ eta ) );
    
    % wn modified
    ind = find(abs(c)>0.1 & abs(c)<0.3);
    gama(ind) = 0.95;
    
    
    % gama * d1
    D = ( 1 - d1 ) ./ max( d1, 0.01 );
    g = I ./ ( 1 + D .^ gama );
%     figure, imshow(g), title('g');
    
    % h + g 
    G = ( 1 - g ) ./ max( g, 0.01 );
    H = ( 1 - h ) ./ max( h, 0.01 );
    v2 = I ./ max( 0.1, ( 1 + ( H .* G ) ) );
    
    t = v2 > 1;
    v2( t ) = x( t );
end 