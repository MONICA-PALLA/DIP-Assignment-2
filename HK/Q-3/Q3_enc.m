function code = Q3_enc(n, m)
q = floor(n/m);                        
r=rem(n,m);                       

q1=ones(1,q);       
q_code=[q1 0];                  
[f,e]=log2(m);                  

if f==0.5 && e == 1             
    code=q_code;
    
else if f==0.5                    
        r_code=de2bi(r,log2(m),'left-msb');
    else
        a=ceil(log2(m));
        b=floor(log2(m));
        
        if r < (2^a - m)                
            r_code=de2bi(r,b,'left-msb'); 
        else
            r=r+(2^a - m);
            r_code=de2bi(r,a,'left-msb');
        end
        
    end
        code=[q_code r_code];  
        
end