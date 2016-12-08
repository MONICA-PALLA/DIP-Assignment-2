function dec = Q3_dec (code, m)

len = length(code);
q = 0;
for i = 1: len
    if code(i) == 1
        q = q + 1; 
    else
        start = i;  
        break;
    end
end

if (m == 1)
    dec = q;  
else
    a = ceil(log2(m));
    b = floor(log2(m));
    
    bcode = code((start+1): (start + b));
    r = bi2de(bcode,'left-msb');
    if r < (2^a - m)
        start = start + b;
    else
        bcode = code((start+1): (start + a));
        r = bi2de(bcode,'left-msb') - (2^a - m);
        start = start + a;
    end
    dec = q * m + r;
end
