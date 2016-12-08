function enco = Henco(sig, dict)
if (~iscell(sig) )
	[m,n] = size(sig);
	sig = mat2cell(sig, ones(1,m), ones(1,n) );
end
maxSize = 0;
dictLength = size(dict,1);
for i = 1 : dictLength
    tempSize = size(dict{i,2},2);
    if (tempSize > maxSize)
        maxSize = tempSize;
    end
end
enco = zeros(1, length(sig)*maxSize);
idxCode = 1;
for i = 1 : length(sig)
    tempcode = [];
    for j = 1 : dictLength
        if( sig{i} == dict{j,1} )
            tempcode = dict{j,2};
            break;
        end
    end
    lenCode = length(tempcode);
    enco(idxCode : idxCode+lenCode-1) = tempcode;
    idxCode = idxCode + lenCode;
end
enco = enco(1:idxCode-1);
if( n == 1 )        
    enco = enco';   
end


