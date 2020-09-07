% clear;
%讀取VERILOG 結果轉為dec MATRIX
% A=table2array(readtable('Hardware.txt'));
A_h=textread('memoryout.txt','%s');
kernal=[2 5];
stride=[1 2];
%OUTPUT矩陣大小
C=ones(166,293);
Cq=ones(166,293);
C_size=size(C);

wordlength=16;
fra=14;
Q.mode = 'fixed'; 
Q.roundmode = 'floor'; 
Q.format = [wordlength 0]; 
q = quantizer(Q);
Q2mode = 'fixed'; 
Q2.roundmode = 'floor'; 
Q2.format = [wordlength fra]; 
q2 = quantizer(Q2);


row=1;
col=1;
for i= 1:(C_size(1)*C_size(2))
    a=convertCharsToStrings(A_h{i});
    B_h=hex2dec(a);
    if (mod(i,C_size(2))==0)
        col=C_size(2);
        row=floor(i/(C_size(2)));
    else
        col=mod(i,C_size(2));
        row=floor(i/(C_size(2)))+1;
    end
    
    C(row,col)=B_h;
end
% hardware_b=num2bin(q,C);
hardware_b=dec2bin(C,16);
hardware_q=bin2num(q2,hardware_b);
for i= 1:(C_size(1)*C_size(2))
    B_h=hardware_q(i);
    if (mod(i,C_size(1))==0)
        row=C_size(1);
        col=floor(i/(C_size(1)));
    else
        
        row=mod(i,C_size(1));
        col=floor(i/(C_size(1)))+1;
    end
    Cq(row,col)=B_h;
end





