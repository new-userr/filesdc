clc;
%%clear all;
close all;
%code_length=0;
symbols=1:5;
p=[0.4 0.15 0.15 0.15 0.15];
[dict,avglen]=huffmandict(symbols,p);
avginfo=0;
for i=1:length(p)
    avginfo=avginfo+p(i)*log2(1/p(i));
end
Efficiency=avginfo*100/avglen;
sig=randsrc(1,100,[symbols;p]);
hcode=huffmanenco(sig,dict);
decode=huffmandeco(hcode,dict);
code_length=length(hcode);
display(avginfo);
display(Efficiency);
isequal(sig,decode)

%{
1) symbols=1:5

2) dict = cell(5, 2);  % Create a 5x2 cell array

3) avglen

4) Efficiency

5) code_length

6) avginfo

7) e

%}