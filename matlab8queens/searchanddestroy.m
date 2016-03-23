function [ out ] = searchanddestroy( vectarray, vect, starti, length )
%searchanddestroy all vectors in vectarray which are the same as vect after starti row are removed (set as nans).

    for i = starti:length,
        if isequal(vect,vectarray(i,:))
            vectarray(i,:) = NaN;
            out = vectarray;
            return
        end
    end
    out = vectarray;
end

