   
   function decode = huffdecode(encode, tree)
   
   for i=1:size(encode,2)
       counter=1;
       decoded = encode{i};
      
       pos=tree;
    for l=1:length(decoded)
        
       if(decoded(l) == '1')
          pos = pos.one;
       else
          pos = pos.zero;
       end
       if(isfield(pos,'val'))
          decode{i,counter} = pos.val;
          counter = counter+1;
          pos = tree;
       end
    end
   end