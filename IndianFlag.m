flag=uint8(zeros(300,600,3));
flag(:,:,:)=255; %Whole flag white
%Orange color
flag(1:100,:,2)=169;
flag(1:100,:,3)=2;
%Green color
flag(200:300,:,1)=0;
flag(200:300,:,3)=0;
%Ashok Chakra
for i=100:200
       for j=1:600
           if (sqrt(power(150-i, 2)+power(300-j, 2))>=45 && 
               sqrt(power(150-i,2)+power(300-j,2))<=50) 
                        flag(i, j,1:2)=0; 
                           
           end 
       end 
     end 
%For printing spokes
     for i=110:190 
    for j=260:340 
        dist= (sqrt(power(i-150, 2)+power(j-300, 2))); 
        k=round(atand((300-j)/(150-i))); 
        if dist<=40 && mod(k, 15)==0 
            flag(i, j, 1:2)=0; 
        end
    end
end
figure;imshow(flag);