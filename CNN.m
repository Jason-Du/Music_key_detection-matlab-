
%clear;
A=ones(166,586);
A_size=size(A);
B=zeros(166,293);
kernal=[2 5];
stride=[1 2];
weight=[1 2 3 0 0 ;1 2 3 0 0];
S=(586/stride(2)-3);
A=table2array(readtable('testdata.csv','HeaderLines',1));

%�q��
wordlength=16;
fra=11;
Q.mode = 'fixed'; 
Q.roundmode = 'floor'; 
Q.format = [wordlength fra]; 
q = quantizer(Q);
% A=quantize(q,A);
% for i=1:(A_size(1)-1)
%     A_slice=A(i,:);
%     A_slice2=A(i+1,:);
%     for j=1:(A_size(2)/stride(2))
%         if j==(A_size(2)/stride(2))
%             B(i,j)=...
%             quantize(q,A_slice(2*j-1)*weight(1,1))+...
%             quantize(q,A_slice2(2*j-1)*weight(2,1));
%             B(i,j)=quantize(q,B(i,j));
%         elseif j==((A_size(2)/stride(2)-1))
%             B(i,j)=...
%             quantize(q,A_slice(2*j-1)*weight(1,1))+...
%             quantize(q,A_slice(2*j)*weight(1,2))+...
%             quantize(q,A_slice2(2*j-1)*weight(2,1))+...
%             quantize(q,A_slice2(2*j)*weight(2,2));
%             B(i,j)=quantize(q,B(i,j));
%         elseif j==((A_size(2)/stride(2)-2))
%             B(i,j)=...
%             quantize(q,A_slice(2*j-1)*weight(1,1))+...
%             quantize(q,A_slice(2*j)*weight(1,2))+...
%             quantize(q,A_slice(2*j+1)*weight(1,3))+...
%             quantize(q,A_slice2(2*j-1)*weight(2,1))+...
%             quantize(q,A_slice2(2*j)*weight(2,2))+...
%             quantize(q,A_slice2(2*j+1)*weight(2,3));
%             B(i,j)=quantize(q,B(i,j));
%         elseif j==((A_size(2)/stride(2)-3))
%             B(i,j)=...
%             quantize(q,A_slice(2*j-1)*weight(1,1))+...
%             quantize(q,A_slice(2*j)*weight(1,2))+...
%             quantize(q,A_slice(2*j+1)*weight(1,3))+...
%             quantize(q,A_slice(2*j+2)*weight(1,4))+...
%             quantize(q,A_slice2(2*j-1)*weight(2,1))+...
%             quantize(q,A_slice2(2*j)*weight(2,2))+...
%             quantize(q,A_slice2(2*j+1)*weight(2,3))+...
%             quantize(q,A_slice2(2*j+2)*weight(2,4));
%             B(i,j)=quantize(q,B(i,j));
%         else
%             B(i,j)=...
%             quantize(q,A_slice(2*j-1)*weight(1,1))+...
%             quantize(q,A_slice(2*j)*weight(1,2))+...
%             quantize(q,A_slice(2*j+1)*weight(1,3))+...
%             quantize(q,A_slice(2*j+2)*weight(1,4))+...
%             quantize(q,A_slice(2*j+3)*weight(1,5))+...
%             quantize(q,A_slice2(2*j-1)*weight(2,1))+...
%             quantize(q,A_slice2(2*j)*weight(2,2))+...
%             quantize(q,A_slice2(j+1)*weight(2,3))+...
%             quantize(q,A_slice2(j+2)*weight(2,4))+...
%             quantize(q,A_slice2(j+3)*weight(2,5));
%             B(i,j)=quantize(q,B(i,j));
%    
%         end
%     end
%     
% end
for i=1:(A_size(1))
   
    if(i==(A_size(1)))
        A_slice=A(i,:);
        for j=1:(A_size(2)/stride(2))
            if j==(A_size(2)/stride(2))
                B(i,j)=...
                A_slice(2*j-1)*weight(1,1);
                

            elseif j==((A_size(2)/stride(2)-1))
                B(i,j)=...
                A_slice(2*j-1)*weight(1,1)+...
                A_slice(2*j)*weight(1,2);

            elseif j==((A_size(2)/stride(2)-2))
                B(i,j)=...
                A_slice(2*j-1)*weight(1,1)+...
                A_slice(2*j)*weight(1,2)+...
                A_slice(2*j+1)*weight(1,3);

            elseif j==((A_size(2)/stride(2)-3))
                B(i,j)=...
                A_slice(2*j-1)*weight(1,1)+...
                A_slice(2*j)*weight(1,2)+...
                A_slice(2*j+1)*weight(1,3)+...
                A_slice(2*j+2)*weight(1,4);

            else
                B(i,j)=...
                A_slice(2*j-1)*weight(1,1)+...
                A_slice(2*j)*weight(1,2)+...
                A_slice(2*j+1)*weight(1,3)+...
                A_slice(2*j+2)*weight(1,4)+...
                A_slice(2*j+3)*weight(1,5);
            end
           
        end
        
        
    else
    A_slice=A(i,:);
    A_slice2=A(i+1,:);
    for j=1:(A_size(2)/stride(2))
        if j==(A_size(2)/stride(2))
            B(i,j)=...
            A_slice(2*j-1)*weight(1,1)+...
            A_slice2(2*j-1)*weight(2,1);

        elseif j==((A_size(2)/stride(2)-1))
            B(i,j)=...
            A_slice(2*j-1)*weight(1,1)+...
            A_slice(2*j)*weight(1,2)+...
            A_slice2(2*j-1)*weight(2,1)+...
            A_slice2(2*j)*weight(2,2);

        elseif j==((A_size(2)/stride(2)-2))
            B(i,j)=...
            A_slice(2*j-1)*weight(1,1)+...
            A_slice(2*j)*weight(1,2)+...
            A_slice(2*j+1)*weight(1,3)+...
            A_slice2(2*j-1)*weight(2,1)+...
            A_slice2(2*j)*weight(2,2)+...
            A_slice2(2*j+1)*weight(2,3);

        elseif j==((A_size(2)/stride(2)-3))
            B(i,j)=...
            A_slice(2*j-1)*weight(1,1)+...
            A_slice(2*j)*weight(1,2)+...
            A_slice(2*j+1)*weight(1,3)+...
            A_slice(2*j+2)*weight(1,4)+...
            A_slice2(2*j-1)*weight(2,1)+...
            A_slice2(2*j)*weight(2,2)+...
            A_slice2(2*j+1)*weight(2,3)+...
            A_slice2(2*j+2)*weight(2,4);

        else
            B(i,j)=...
            A_slice(2*j-1)*weight(1,1)+...
            A_slice(2*j)*weight(1,2)+...
            A_slice(2*j+1)*weight(1,3)+...
            A_slice(2*j+2)*weight(1,4)+...
            A_slice(2*j+3)*weight(1,5)+...
            A_slice2(2*j-1)*weight(2,1)+...
            A_slice2(2*j)*weight(2,2)+...
            A_slice2(j+1)*weight(2,3)+...
            A_slice2(j+2)*weight(2,4)+...
            A_slice2(j+3)*weight(2,5);


        end
    end
    end
    
end



