clc;
clear all;
close all;
code_length=0;
symbols=[1:5]
p=[0.4 0.15 0.15 0.15 0.15];
[dict,avglen]=huffmandict(symbols,p)
avginfo=0;
for i=1:length(p)
avginfo=avginfo+p(i)*log2(1/p(i));
end
Efficiency=avginfo*100/avglen
sig=randsrc(1,100,[symbols;p]);
hcode=huffmanenco(sig,dict);
decode=huffmandeco(hcode,dict);
code_length=length(hcode)
display(avginfo);
display(Efficiency);
isequal(sig,decode)