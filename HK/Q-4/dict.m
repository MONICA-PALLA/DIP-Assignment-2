function [dict,avglen] = dict(sig, prob, varargin)
ROUND_OFF_ERROR = 1e-6;
n_ary = [];
variance = '';
msg=nargchk(2,4, nargin);
if ( msg )
	error(message('comm:huffmandict:InputArgumentCount'))
end
if nargin > 2
	n_ary = varargin{1};
end
if nargin == 4
	variance = varargin{2};
end
if isempty(n_ary)
    n_ary = 2; 
end
if ( variance )
else
    variance = 'max'; 
end
if ~iscell(sig)
	[m,n] = size(sig);
	sig = mat2cell(sig, ones(1,m), ones(1,n)) ;
end
lenSig = length(sig);
isalphanumeric = zeros(1, lenSig);
for i=1:lenSig
	isalphanumeric(i) = ischar(sig{i}) || isnumeric(sig{i});
end
huff_tree = struct('signal', [], 'probability', [],...
    'child', [], 'code', [], 'origOrder', -1);
for i=1:length( sig )
    huff_tree(i).signal = sig{i}; 
    huff_tree(i).probability = prob(i); 
	huff_tree(i).origOrder = i;
end
[s, i] = sort(prob);
huff_tree = huff_tree(i);
huff_tree = create_tree(huff_tree, n_ary, variance); % create a Huffman tree
[huff_tree,dict,avglen] = create_dict(huff_tree,{},0, n_ary); % create the codebook
[dictsort,dictsortorder] = sort([dict{:,4}]);
lenDict = length(dictsortorder);
finaldict = cell(lenDict, 2);
for i=1:length(dictsortorder)
    finaldict{i,1} = dict{dictsortorder(i), 1};
    finaldict{i,2} = dict{dictsortorder(i), 2};
end
dict = finaldict;
function huff_tree = create_tree(huff_tree, n_ary, variance)
if( length(huff_tree) <= 1)
    return;
end
temp = struct('signal', [], 'probability', 0, ...
    'child', [], 'code', []);
for i=1:n_ary
    if isempty(huff_tree), break; end
    temp.probability = temp.probability + huff_tree(1).probability; % for ascending order
    temp.child{i} = huff_tree(1);
	temp.origOrder = -1;
    huff_tree(1) = [];
end
if( strcmpi(variance, 'min') == 1 )
    huff_tree = insertMinVar(huff_tree, temp);
else
    huff_tree = insertMaxVar(huff_tree, temp);
end
% create a Huffman tree from the reduced number of free nodes
huff_tree = create_tree(huff_tree, n_ary, variance);
return;
function huff_tree = insertMaxVar(huff_tree, newNode)
i = 1;
while i <= length(huff_tree) && ...
        newNode.probability > huff_tree(i).probability 
    i = i+1;
end
huff_tree = [huff_tree(1:i-1) newNode huff_tree(i:end)];
function huff_tree = insertMinVar(huff_tree, newNode)
i = 1;
while i <= length(huff_tree) && ...
        newNode.probability >= huff_tree(i).probability
    i = i+1;
end
huff_tree = [huff_tree(1:i-1) newNode huff_tree(i:end)];
function [huff_tree,dict,total_wted_len] = create_dict(huff_tree,dict,total_wted_len, n_ary)
if isempty(huff_tree.child)
    dict{end+1,1} = huff_tree.signal;
    dict{end, 2} = huff_tree.code;
    dict{end, 3} = length(huff_tree.code);
	dict{end, 4} = huff_tree.origOrder;
    total_wted_len = total_wted_len + length(huff_tree.code)*huff_tree.probability;
    return;
end
num_childrens = length(huff_tree.child);
for i = 1:num_childrens
    huff_tree.child{i}.code = [huff_tree(end).code, (num_childrens-i)];
    [huff_tree.child{i}, dict, total_wted_len] = ...
        create_dict(huff_tree.child{i}, dict, total_wted_len, n_ary);
end
