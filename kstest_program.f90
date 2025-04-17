PROGRAM kst_programme
! declaration of variables
IMPLICIT NONE


INTERFACE 
SUBROUTINE ks2d2s(x1,y1,x2,y2,d,prob)
IMPLICIT NONE
DOUBLE PRECISION, INTENT(OUT) :: d,prob
DOUBLE PRECISION, DIMENSION(:), INTENT(IN) :: x1,x2,y1,y2
END SUBROUTINE ks2d2s
END INTERFACE

double precision :: PI
character(200) :: path_real,path_LCDM,path_timescape,file_real,file_LCDM,file_timescape
double precision, allocatable :: H_real(:),fi_real(:),H_LCDM(:),fi_LCDM(:),H_timescape(:),fi_timescape(:)
double precision, allocatable :: weights_real(:),weights_LCDM(:),weights_timescape(:)
double precision, allocatable :: wH_real(:),wfi_real(:),wH_LCDM(:),wfi_LCDM(:),wH_timescape(:),wfi_timescape(:)
integer :: n_real,n_LCDM,n_timescape,i,io_err,n_id,ii
integer :: n_real_weight,n_LCDM_weight,n_timescape_weight,help_count
double precision :: d_value_LCDM,prob_value_LCDM,d_value_timescape,prob_value_timescape,dummy
character(20) :: id_str

WRITE(*,*) '============================================================'
WRITE(*,*) '    programme KS TEST started'
WRITE(*,*) '============================================================'

! define constants
PI=ACOS(-1.D0)

path_real='real_data_calibrated'
path_LCDM='sim_data_lcdm'
path_timescape='sim_data_timescape'

path_real=adjustl(path_real)
path_LCDM=adjustl(path_LCDM)
path_timescape=adjustl(path_timescape)


 OPEN (55,file='analysis/ks_test_all.txt')

DO n_id=1,64

WRITE(id_str,*) n_id
id_str=TRIM(adjustl(id_str))

file_real='selected_results_lg.txt'
file_LCDM='selected_results_'//TRIM(id_str)//'.txt'
file_timescape='selected_results_'//TRIM(id_str)//'.txt'

file_real=adjustl(file_real)
file_LCDM=adjustl(file_LCDM)
file_timescape=adjustl(file_timescape)

! get length of files
OPEN (50,file=TRIM(path_real)//'/'//TRIM(file_real))
io_err=0
n_real=0
DO WHILE (io_err==0) 
READ(50,*,iostat=io_err) 
n_real=n_real+1
END DO
 CLOSE(50)
n_real=n_real-1


! get length of files
OPEN (50,file=TRIM(path_LCDM)//'/'//TRIM(file_LCDM))
io_err=0
n_LCDM=0
DO WHILE (io_err==0) 
READ(50,*,iostat=io_err) 
n_LCDM=n_LCDM+1
END DO
 CLOSE(50)
n_LCDM=n_LCDM-1
!  n_LCDM=n_LCDM-1
! n_real=n_LCDM
! n_real=10
! get length of files
OPEN (50,file=TRIM(path_timescape)//'/'//TRIM(file_timescape))
io_err=0
n_timescape=0
DO WHILE (io_err==0) 
READ(50,*,iostat=io_err) 
n_timescape=n_timescape+1
END DO
 CLOSE(50)
n_timescape=n_timescape-1
! WRITE(*,*) n_real,n_LCDM,n_timescape

allocate(H_real(1:n_real))
allocate(fi_real(1:n_real))
allocate(weights_real(1:n_real))
allocate(H_LCDM(1:n_LCDM))
allocate(fi_LCDM(1:n_LCDM))
allocate(weights_LCDM(1:n_LCDM))
allocate(H_timescape(1:n_timescape))
allocate(fi_timescape(1:n_timescape))
allocate(weights_timescape(1:n_timescape))



OPEN (50,file=TRIM(path_real)//'/'//TRIM(file_real))
DO i=1,n_real
READ(50,*) fi_real(i),H_real(i),dummy,weights_real(i)
END DO
 CLOSE(50)


OPEN (50,file=TRIM(path_LCDM)//'/'//TRIM(file_LCDM))
DO i=1,n_LCDM
READ(50,*) fi_LCDM(i),H_LCDM(i),dummy,weights_LCDM(i)
END DO
 CLOSE(50)


OPEN (50,file=TRIM(path_timescape)//'/'//TRIM(file_timescape))
DO i=1,n_timescape
READ(50,*) fi_timescape(i),H_timescape(i),dummy,weights_timescape(i)
END DO
 CLOSE(50)

 
n_real_weight=0
n_LCDM_weight=0
n_timescape_weight=0

DO i=1,n_real
n_real_weight=n_real_weight+NINT(1.D0/(weights_real(i)**2))
END DO

DO i=1,n_LCDM
n_LCDM_weight=n_LCDM_weight+NINT(1.D0/(weights_LCDM(i)**2))
END DO

DO i=1,n_timescape
n_timescape_weight=n_timescape_weight+NINT(1.D0/(weights_timescape(i)**2))
END DO

allocate(wH_real(1:n_real_weight))
allocate(wfi_real(1:n_real_weight))
allocate(wH_LCDM(1:n_LCDM_weight))
allocate(wfi_LCDM(1:n_LCDM_weight))
allocate(wH_timescape(1:n_timescape_weight))
allocate(wfi_timescape(1:n_timescape_weight))

help_count=0
 DO i=1,n_real
 DO ii=1,NINT(1.D0/(weights_real(i)**2))
 help_count=help_count+1
 wH_real(help_count)=H_real(i)
 wfi_real(help_count)=fi_real(i)
 END DO
 END DO

help_count=0
 DO i=1,n_LCDM
 DO ii=1,NINT(1.D0/(weights_LCDM(i)**2))
 help_count=help_count+1
 wH_LCDM(help_count)=H_LCDM(i)
 wfi_LCDM(help_count)=fi_LCDM(i)
 END DO
 END DO

help_count=0
 DO i=1,n_timescape
 DO ii=1,NINT(1.D0/(weights_timescape(i)**2))
 help_count=help_count+1
 wH_timescape(help_count)=H_timescape(i)
 wfi_timescape(help_count)=fi_timescape(i)
 END DO
 END DO
 


CALL ks2d2s(fi_real,H_real,fi_LCDM,H_LCDM,d_value_LCDM,prob_value_LCDM)
! CALL ks2d2s(wfi_real,wH_real,wfi_LCDM,wH_LCDM,d_value_LCDM,prob_value_LCDM)

CALL ks2d2s(fi_real,H_real,fi_timescape,H_timescape,d_value_timescape,prob_value_timescape)
! CALL ks2d2s(wfi_real,wH_real,wfi_timescape,wH_timescape,d_value_timescape,prob_value_timescape)


WRITE(55,*) d_value_LCDM,prob_value_LCDM,d_value_timescape,prob_value_timescape,(prob_value_LCDM/prob_value_timescape)


deallocate(wH_real)
deallocate(wfi_real)
deallocate(wH_LCDM)
deallocate(wfi_LCDM)
deallocate(wH_timescape)
deallocate(wfi_timescape)

deallocate(H_real)
deallocate(fi_real)
deallocate(H_LCDM)
deallocate(fi_LCDM)
deallocate(H_timescape)
deallocate(fi_timescape)
deallocate(weights_real)
deallocate(weights_LCDM)
deallocate(weights_timescape)


END DO

CLOSE(55)
 
WRITE(*,*) '============================================================'
WRITE(*,*) '    programme complete'
WRITE(*,*) '============================================================'




END PROGRAM


! SUBROUTINE ks2d1s(x1,y1,n1,quadv1,d1,prob)
! INTEGER :: n1
! DOUBLE PRECISION :: d,prob
! DIMENSION, DOUBLE PRECISION :: x(n1),y(n1)
! EXTERNAL quadv1
! 
! INTEGER j
! DOUBLE PRECISION dum,dumm,fa,fb,fc,fd,ga,gb,gc,gd,r1,rr,sqen,probks
! 
! 
! d1=0.D0
! DO j=1,n1
! CALL quadct(x1(j),y1(j),x1,y1,n1,fa,fb,fc,fd)
! CALL quadv1(x1(j),y1(j),ga,gb,gc,gd)
! d1=max(d1,abs(fa-ga),abs(fb-gb),abs(fc-gc),abs(fd-gd))
! END DO
! 
! CALL pearsn(x1,y1,n1,r1,dum,dumm)
! sqen=SQRT(float(n1))
! rr=SQRT(1.0-r1**2)
! prob=probks(d1*sqen/(1.0+rr*(0.25-0.75/sqen)))
! 
! RETURN
! END SUBROUTINE ks2d1s
! 



SUBROUTINE quadct(x,y,xx,yy,fa,fb,fc,fd)
IMPLICIT NONE
DOUBLE PRECISION, INTENT(OUT) :: fa,fb,fc,fd
DOUBLE PRECISION, INTENT(IN) :: x,y
DOUBLE PRECISION, DIMENSION(:), INTENT(IN) :: xx,yy
INTEGER :: k,na,nb,nc,nd,nn
DOUBLE PRECISION :: ff

nn=size(xx)
na=0
nb=0
nc=0
nd=0

DO k=1,nn
IF (yy(k).GT.y) THEN
IF (xx(k).GT.x) THEN
na=na+1
ELSE
nb=nb+1
END IF
ELSE
IF (xx(k).GT.x) THEN
nd=nd+1
ELSE
nc=nc+1
END IF
END IF
END DO

ff=1.0/float(nn)
fa=ff*float(na)
fb=ff*float(nb)
fc=ff*float(nc)
fd=ff*float(nd)

END SUBROUTINE quadct



! 
! SUBROUTINE quadv1(x,y,fa,fb,fc,fd)
! IMPLICIT NONE
! DOUBLE PRECISION, INTENT(OUT) :: fa,fb,fc,fd
! DOUBLE PRECISION, INTENT(IN) :: x,y
! DOUBLE PRECISION :: qa,qb,qc,qd
! 
! qa=min(2.0,max(0.0,1.0-x))
! qb=min(2.0,max(0.0,1.0-y))
! qc=min(2.0,max(0.0,x+1.0))
! qd=min(2.0,max(0.0,y+1.0))
! 
! fa=0.25*qa*qb
! fb=0.25*qb*qc
! fc=0.25*qc*qd
! fd=0.25*qd*qa
! 
! END SUBROUTINE quadv1



SUBROUTINE ks2d2s(x1,y1,x2,y2,d,prob)

IMPLICIT NONE
DOUBLE PRECISION, INTENT(OUT) :: d,prob
DOUBLE PRECISION, DIMENSION(:), INTENT(IN) :: x1,x2,y1,y2

INTERFACE 

! SUBROUTINE quadv1(x,y,fa,fb,fc,fd)
! IMPLICIT NONE
! DOUBLE PRECISION, INTENT(OUT) :: fa,fb,fc,fd
! DOUBLE PRECISION, INTENT(IN) :: x,y
! END SUBROUTINE quadv1

SUBROUTINE quadct(x,y,xx,yy,fa,fb,fc,fd)
IMPLICIT NONE
DOUBLE PRECISION, INTENT(OUT) :: fa,fb,fc,fd
DOUBLE PRECISION, INTENT(IN) :: x,y
DOUBLE PRECISION, DIMENSION(:), INTENT(IN) :: xx,yy
END SUBROUTINE quadct

SUBROUTINE pearsn(x,y,r,prop,z)
IMPLICIT NONE
double precision, intent(out) ::r,prop,z
double precision, dimension(:), intent(in) ::x,y
END SUBROUTINE pearsn

END INTERFACE

INTEGER :: j,n1,n2
DOUBLE PRECISION d1,d2,dum,dumm,fa,fb,fc,fd,ga,gb,gc,gd,r1,r2,rr,sqen
DOUBLE PRECISION , external :: probks

n1=size(x1)
n2=size(x2)
!  WRITE(*,*) n1,n2
d1=0.0
DO j=1,n1
CALL quadct(x1(j),y1(j),x1,y1,fa,fb,fc,fd)
CALL quadct(x1(j),y1(j),x2,y2,ga,gb,gc,gd)
d1=max(d1,abs(fa-ga),abs(fb-gb),abs(fc-gc),abs(fd-gd))
END DO


d2=0.0
DO j=1,n2
CALL quadct(x2(j),y2(j),x1,y1,fa,fb,fc,fd)
CALL quadct(x2(j),y2(j),x2,y2,ga,gb,gc,gd)
d2=max(d1,abs(fa-ga),abs(fb-gb),abs(fc-gc),abs(fd-gd))
END DO

d=0.5*(d1+d2)

sqen=SQRT(float(n1)*float(n2)/float(n1+n2))

CALL pearsn(x1,y1,r1,dum,dumm)
CALL pearsn(x2,y2,r2,dum,dumm)

rr=SQRT(1.0-0.5*(r1**2+r2**2))
! WRITE(*,*) r1,r2,rr
! WRITE(*,*) d1,d2,d
! WRITE(*,*) sqen
! WRITE(*,*) d*sqen/(1.0+rr*(0.25-0.75/sqen))
prob=probks(d*sqen/(1.0+rr*(0.25-0.75/sqen)))


END SUBROUTINE ks2d2s




SUBROUTINE pearsn(x,y,r,prop,z)

IMPLICIT NONE
double precision, intent(out) ::r,prop,z
double precision, dimension(:), intent(in) ::x,y
double precision, parameter :: tiny=1.E-20
double precision, dimension(size(x)) ::xt,yt
double precision :: ax,ay,df,sxx,sxy,syy,t
DOUBLE PRECISION , external :: erfcc
integer :: n,i
! n=assert_eq(size(x),size(y),'pearsn')
n=size(x)
ax=sum(x)/float(n)
ay=sum(y)/float(n) 
DO i=1,n
xt(i)=x(i)-ax
yt(i)=y(i)-ay
END DO
sxx=0.D0
DO i=1,n
sxx=sxx+xt(i)*xt(i)
END DO
syy=0.D0
DO i=1,n
syy=syy+yt(i)*yt(i)
END DO
sxy=0.D0
DO i=1,n
sxy=sxy+xt(i)*yt(i)
END DO
r=sxy/(SQRT(sxx*syy)+TINY)
! WRITE(*,*) r
z=0.5*log(((1.0+r)+TINY)/((1.0-r)*TINY))
df=n-2
t=r*SQRT(df/(((1.0-r)+TINY)*((1.0+r)+TINY)))
! prop=betai(0.5*df,0.5,df/(df+t**2))
prop=erfcc(abs(z*SQRT(n-1.0))/SQRT(2.0))

END SUBROUTINE pearsn


DOUBLE PRECISION  FUNCTION probks(alam)
IMPLICIT NONE
DOUBLE PRECISION, INTENT(IN) :: alam
DOUBLE PRECISION, PARAMETER :: EPS1=0.001,EPS2=1.E-8
INTEGER, PARAMETER :: NITER=1000
INTEGER :: j
DOUBLE PRECISION :: a2,fac,term,termbf
a2=-2.0*alam**2
fac=2.0
probks=0.0
termbf=0.0
DO j=1,NITER
term=fac*EXP(a2*float(j)**2)
probks=probks+term
IF ((ABS(term)<=EPS1*termbf ).OR. (ABS(term)<=EPS2*probks)) RETURN
fac=-fac
termbf=ABS(term)
END DO
WRITE(*,*) 'failed to converge'
probks=1.0
END FUNCTION


DOUBLE PRECISION FUNCTION erfcc(x)
DOUBLE PRECISION :: x
DOUBLE PRECISION :: t,z

z=ABS(x)
t=1.0/(1.0+0.5*z)
erfcc=t*exp(-z*z-1.26551223+t*(1.00002368+t*(0.37409196+t*(0.09678418+t*(-0.18628806+t*(0.27886807+&
t*(-1.13520398+t*(1.48851587+t*(-0.82215223+t*0.17087277)))))))))
IF (x.lt.0) erfcc=2.0-erfcc
RETURN
END FUNCTION







































 
