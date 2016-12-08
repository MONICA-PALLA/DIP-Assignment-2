function deco = Hdeco(comp, dict)

msg=nargchk(2,2, nargin);
[m,n] = size(comp);

if ( strcmp(class(comp), 'double') == 0 )
	error(message('comm:huffmandeco:InvalidCodeType'))
end
isSigNonNumeric = max(cellfun('isclass', {dict{:,1}}, 'char') );
deco = {};
i = 1;
while(i <= length(comp))
    tempcode = comp(i); 
    found_code = is_a_valid_code(tempcode, dict);
    while(isempty(found_code) && i < length(comp))
        i = i+1;
        tempcode = [tempcode, comp(i)];
        found_code = is_a_valid_code(tempcode, dict);
    end
    if( i == length(comp) && isempty(found_code) )
        error(message('comm:huffmandeco:CodeNotFound'));
    end
	deco{end+1} = found_code;
    i=i+1;
end
if( n == 1 )         
    deco = deco';    
end
if ( ~isSigNonNumeric )
    decoMat = zeros(size(deco));
    decoMat = feval(class(dict{1,1}), decoMat);  % to support single precision
    for i = 1 : length(decoMat)
        decoMat(i) = deco{i};
    end
    deco = decoMat;
end
function found_code = is_a_valid_code(code, dict)
found_code = [];
m = size(dict);
for i=1:m(1)
    if ( isequal(code, dict{i,2}) )  
        found_code = dict{i,1};
        return;
    end
end
