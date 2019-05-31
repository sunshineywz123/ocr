clear all;clc;
close all;
I=imread('1.jpg');
th=graythresh(I);
I_bw=im2bw(I,th);
% figure
% imshow(I_bw);
%%
[row,col]=size(I_bw);
c=fix(col/5);
d=fix(row/14);
t=4;
p=10;
b(1)=1;
a(1)=1;
q=0;
for i=1:t
    len=c;
    while mean(I_bw(:,b(i)+len))>0.06
        len=len+1;
    end
    b(i+1)=b(i)+len;
    I_col=I_bw(:,b(i):b(i+1));
    for j=1:p
        length=d;
        while mean(I_col(a(j)+length,:))>0.006
            length=length+1;
        end
        a(j+1)=a(j)+length;
        I_row=I_col(a(j):a(j+1),:);
        q=q+1;
        subplot(5,8,q)
        imshow(I_row);
    end
end
