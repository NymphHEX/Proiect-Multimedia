
%*****************************************

tic
block_size=8;

inp=imread('Lena.tiff');
inp=rgb2gray(inp);
[ro,co]=size(inp);
Np=(ro/block_size)*(co/block_size); % number of Xi

Nc=Np/2;
L=block_size^2;
C=randi([0,255],Nc,L);
X=zeros(Np,L);

k=1;
for i=1:block_size:ro
    for j=1:block_size:co
        tem=inp(i:i+block_size-1,j:j+block_size-1);
        X(k,:)=tem(:);
        k=k+1;
    end
end

for j=1:L
    min_X=min(X(:,j));
    max_X=max(X(:,j));
    C(C(:,j)<min_X,j)=min_X;
    C(C(:,j)>max_X,j)=max_X;
end

lim=50;
for m=1:lim
U=zeros(Np,Nc);

for i=1:Np
    for j=1:Nc
        T=(X(i,:)-C(j,:));
        dis(1,j)=sqrt(T*T');
    end
    coo=find(dis==min(dis));
    U(i,coo(1,1))=1;
end

fg=C;

for j=1:Nc
    sig=0;
    Usig=sum(U(:,j));
    if Usig~=0
        for i=1:Np
            Ind=X(i,:).*U(i,j);
            sig=sig+Ind;
        end
        C(j,:)=sig/Usig;
    end
end
dif=fg-C;
deff(m)=sqrt(sum(sum(dif.^2)));
end
C=round(C);
i=1:lim;
plot(i,deff)

% constructed_image=zeros(ro,co);
% j=1;
% k=1;
% for i=1:Np
% tem=reshape(X(i,:),block_size,block_size);
% constructed_image(j:j+block_size-1,k:k+block_size-1)=tem;
% k=k+block_size;
% if k>co
% j=j+block_size;
% k=1;
% end
% end
% imshow(constructed_image,[])

[r,c]=find(U==1);

Xx=zeros(size(X));
for i=1:Np
    Xx(r(i),:)=C(c(i),:);
end

constructed_image=zeros(ro,co);
j=1;
k=1;
for i=1:Np
    tem=reshape(Xx(i,:),block_size,block_size);
    constructed_image(j:j+block_size-1,k:k+block_size-1)=tem;
    k=k+block_size;
    if k>co
        j=j+block_size;
        k=1;
    end
end
figure;
imshow(constructed_image,[]) 
imwrite(constructed_image,[],rezultat_imagine.tiff)