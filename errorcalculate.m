totalerror=0;
% for i=1:166
%    for j=1:293
%        error=(abs(Cq(i,j)-B(i,j)))/B(i,j);
%        
%        totalerror=error+totalerror;
%     
%     
%    end
% end
E=abs(Cq-B);
E_sum=sum(sum(E.^2));

totalerror=sqrt(E_sum)/(166*293);