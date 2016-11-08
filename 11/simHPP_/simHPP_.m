
function [y] = simHPP(lambda,T,N)
 if(lambda <= 0 || length(lambda)~=1)
 	error('simHPP: Lambda must be a positive scalar.');
 end
 if(T <= 0 || length(T)~=1)
 	error('simHPP: T must be a positive scalar.');
 end
 if(N <= 0 || length(N)~=1)
 	error('simHPP: N must be a positive scalar.');
 end
  EN       = poissrnd(lambda*T,N,1);
  ym       = T*ones(2*max(EN)+2,N);
  tmp      = zeros(2*max(EN)+2,N,2);
  y        = tmp;
  y(:,:,1) = ym;
  y(:,:,2) = ones(2*max(EN)+2,1)*EN';

  i=1;
  while(i<=N)
    if(EN(i)>0)
    	ttmp = sort(T*unifrnd(0,1,EN(i),1));
    	y(1:(2*EN(i)+1),i,1) = [0;ttmp(ceil((1:(2*EN(i)))/2))];
    else
        y(1,i,1)             = 0;
    end
    y(1:(2*EN(i)+2),i,2) = [0;floor((1:(2*EN(i)))/2)';EN(i)];
    i=i+1;
  end


end