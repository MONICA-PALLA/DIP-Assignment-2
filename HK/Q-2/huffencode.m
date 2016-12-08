
function encode = huffencode(input, table) 
   h=1;
   for l=1:size(input,1)
            encoded='';
       for k=1:size(input,2)
             encoded = strcat(encoded,table.code{strcmp(table.val,input{l,k})}); 
       end
       encode{h}=encoded;
       h=h+1;
   end;