A=imread('/Users/takeda/Downloads/texture5.bmp'); 
B=rgb2gray(A);
subplot(1,2,1)
imshow(A)
title ('Orignial Image')
subplot(1,2,2);
imhist(B);
print -deps epsFig
title('Intensity Histogram')
row=size(B,1);
col=size(B,2);
level=256; 
[count, cell]=imhist(B,level);
stem (cell, count) 
MEN=0; CNT=0; VAR=0;SKW=0;KRT=0;EGY=0;EPY=0;
for i=1:level
    P(i)=count(i)/(row*col);
end
for i=1:level
    MEN=MEN+i*P(i);
    CNT=CNT+i^2*P(i);
end
for i=1:level
    VAR=VAR+(i-MEN)^2*P(i);
end
for i=1:level
    SKW=SKW+(i-MEN)^3*P(i);
    KRT=KRT+(i-MEN)^4*P(i);
    EGY=EGY+P(i)^2;
    if P(i)>0
        EPY=EPY-P(i)*log(P(i));
    end
end
MEN, CNT, VAR, SKW=SKW/(VAR^3), KRT=KRT/VAR^4, EGY, EPY 