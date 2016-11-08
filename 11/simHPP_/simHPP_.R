# ---------------------------------------------------------------------
# Book:        STF
# ---------------------------------------------------------------------
# See also:    simNHPP
# ---------------------------------------------------------------------
# Quantlet:    simHPP
# ---------------------------------------------------------------------
# Description: generates homogeneous Poisson process with intensity lambda.
# ---------------------------------------------------------------------
# Usage:       y = simHPP(lambda,T,N)
# Input:
# Parameter:   lambda
# Definition:  scalar, intensity of the Poisson process
# Parameter:   T
# Definition:  scalar, time horizon
# Parameter:   N
# Definition:  scalar, number of trajectories
# ---------------------------------------------------------------------
# Output:
# Parameter:   y
# Definition:  2*max+2 x N x 2 array, generated process - max is the
#              maximum number of jumps for all generated trajectories
# ---------------------------------------------------------------------
# Example:
#              y1 = simHPP(3,5,1)
#              y2 = simHPP(10,5,1)
#              plot(y1[,,1],y1[,,2],type="l",col="red3",ylim=c(min(y1[,,2],y2[,,2]),max(y1[,,2],y2[,,2])),ylab="",xlab="")
#              lines(y2[,,1],y2[,,2],type="l",col="blue3")
# ---------------------------------------------------------------------
# Result:      Show two trajectories of homogeneous Poisson process
# ---------------------------------------------------------------------
# Keywords:    Poisson process, risk process
# ---------------------------------------------------------------------
# Reference:   K. Burnecki, R.Weron (2004) "Modeling of the risk process",
#	           in "Statistical Tools for Finance and Insurance",
#              eds. P. Cizek, W. Härdle, R. Weron, Springer.
# ---------------------------------------------------------------------
# Author:      Awdesch Melzer 20130626
# ---------------------------------------------------------------------

simHPP = function(lambda,T,N){
 if(lambda <= 0 || length(lambda)!=1){
 	stop("simHPP: Lambda must be a positive scalar.")
 }
 if(T <= 0 || length(T)!=1){
 	stop("simHPP: T must be a positive scalar.")
 }
 if(N <= 0 || length(N)!=1){
 	stop("simHPP: N must be a positive scalar.")
 }
  EN      = rpois(N,lambda*T)
  ym      = matrix(T,2*max(EN)+2,N)
  tmp     = array(0,c(2*max(EN)+2,N,2))
  y       = tmp
  y[,,1] = ym
  y[,,2] = matrix(1,2*max(EN)+2,1)%*%t(EN)

  i=1
  while(i<=N){
    if(EN[i]>0){
    	ttmp = c(sort(T*runif(EN[i])))
    	y[1:(2*EN[i]+1),i,1] = c(0,ttmp[ceiling((1:(2*EN[i]))/2)])
    }else{
        y[1,i,1]             = 0
    }
    y[1:(2*EN[i]+2),i,2] = c(0,floor((1:(2*EN[i]))/2),EN[i])
    i=i+1
  }
return(y)

}