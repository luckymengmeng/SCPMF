function [score]=SCPMFDR(Y,M,D,r)
[~,m]=size(M);
[~,n]=size(D);
B=spones(Y);
rand('state',0);
W=rand(m,r);
rand('state',0);
H=rand(n,r);
W=W';
H=H';
parm1=1;
parm2=1;
parm3=0.1;
parm4=0.1;
k=1;
while k<1000  
    W=W.*((H*(Y'.*B')+2*parm3*W*M)./(H*((H'*W).*B')+parm1*W+2*parm3*W*(W')*W));
    H=H.*((W*(Y.*B)+2*parm4*H*D)./(W*((W'*H).*B)+parm2*H+2*parm4*H*(H')*H));
    %error(k)=0.5*norm(A-X*W*H'*Y','fro')^0.5;%+0.5*norm(W,'fro')^2+0.5*norm(H,'fro')^2;
    k=k+1;
end
score=W'*H;
end


