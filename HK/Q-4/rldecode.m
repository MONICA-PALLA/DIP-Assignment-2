function d = rldecode(x)
c=size(x);
if c(1)==1
    o=1;
    for l=1:2:length(x)
       for l1=o:o+x(l)-1
           d(l1)=x(l+1);
       end
       o=o+x(l);
    end
elseif c(1)>1
    len=c(1);
    o=1;
    l=1;
    while l<=len
        o=1;
        for l1=1:2:length(x(l,:))
            if x(l,l1)==0
                l=l+1;
            else
                for l2=o:o+x(l,l1)-1
                    d(l,l2)=x(l,l1+1);
                end
                o=o+x(l,l1);
            end
        end
        l=l+1;
    end
end
%d=reshape(d,82,83);
%size(d)
end