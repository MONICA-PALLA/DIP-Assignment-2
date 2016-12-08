function [tree, table] = hufftree(alphabet,prob)

   for l=1:length(alphabet)       
      nodes(l).val = alphabet{l};
      nodes(l).zero= '';
      nodes(l).one='';
      nodes(l).prob = prob(l);
   end
   while length(nodes)>1                           
      [x,I]=sort(prob);                         
      prob = [prob(I(1))+prob(I(2)) prob(I(3:end))];
      node.zero = nodes(I(1));         
      node.one  = nodes(I(2));         
      node.prob = prob(1);
      node.val = '';
      nodes = [node nodes(I(3:end))];
   end

   table.val={}; table.code={};
   [tree, table] = descend(nodes(1),table,'');

   function [tree, table] = descend(oldtree, oldtable, code)

   table = oldtable;
   if(~isempty(oldtree.val))
      tree.val = oldtree.val;
      table.val{end+1}  = oldtree.val;
      table.code{end+1} = code;
   else
      [t0, table] = descend(oldtree.zero, table, strcat(code,'0'));
      [t1, table] = descend(oldtree.one,  table, strcat(code,'1'));
      tree.zero=t0;
      tree.one= t1;
   end