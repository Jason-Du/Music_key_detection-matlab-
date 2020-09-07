%clear;
A_hi=table2array(readtable('testdata.csv','HeaderLines',1));
%量化取DATA量化
wordlength=16;
fra=14;
Q.mode = 'fixed'; 
Q.roundmode = 'floor'; 
Q.format = [wordlength fra]; 
q = quantizer(Q);


%量化DATA量化去小數
Q2.mode = 'fixed'; 
Q2.roundmode = 'floor'; 
Q2.format = [wordlength 0]; 
q2 = quantizer(Q2);

hardware_b=num2bin(q,A_hi);
hardware_b(2,:)
hardware_q=bin2num(q2,hardware_b);
hardware_in=cell(166,586);

hardware_in_size=size(A_hi);
index=0;
for col=1:586
    for row=1:166
        index=index+1;
        test=convertCharsToStrings(hardware_b(index,:));
        test = dec2hex(bin2dec(test),4);
        hardware_in{row,col}=test;
    end
end

writecell(hardware_in,"hardware_in.csv")






