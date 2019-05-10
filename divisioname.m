pkg load image
i=uint8(zeros(700,1000,3));
i(:,:,:)=0;
%blue
i(:,1:500,1)=255;
%green
i(:,501:1000,2)=255;
%create s
i(100:200,250:750,1)=255;
i(100:200,250:750,2:3)=0;
i(201:400,250:350,1)=255;
i(201:400,250:350,2:3)=0;
i(300:400,350:750,1)=255;
i(300:400,350:750,2:3)=0;
i(300:600,650:750,1)=255;
i(300:600,650:750,2:3)=0;
i(500:600,250:750,1)=255;
i(500:600,250:750,2:3)=0;
%grayscale convertor
gray=uint8(zeros(size(i,1),size(i,2)));
  for a=1:size(i,1)
    for b=1:size(i,2)
      gray(a,b,:)=(i(a,b,1)*0.2989)+(i(a,b,2)*0.5870)+(i(a,b,3)*0.114);
      end
   end
%OTSU implementation
n=imhist(gray);
N=sum(n);
max=0;
for a=1:256
  P(a)=n(a)/N;
end
ug=dot([0:255],P(1:256));
for T=2:255
  w0=sum(P(1:T));
  w1=sum(P(T+1:256));
  u0=dot([0:T-1],P(1:T))/w0;
  u1=dot([T:255],P(T+1:256))/w1;
  sigma=(w0*((u0-ug)^2))+(w1*((u1-ug)^2));
  if  sigma > max
    max = sigma;
    threshold = T-1;
  end
end
bw=im2bw(gray,threshold/255);
figure;imshow(bw);
imwrite(bw,"abc.jpg");
  
  
