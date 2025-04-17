PROGRAM millimilhalo
! declaration of variables
IMPLICIT NONE
include 'mpif.h'
double precision :: PI,H0,q0,light,G,tophat,rho_crit,rescale
integer :: io_err,n_h,i,ii,n_used,n_active,n_active_old,n_r,n_infi,uuu,itercount,hcount
integer :: n_mfi_final,n_mfi_first,iii,hc1,hc2,hhhhh
character(200) :: filename,intial_values
integer(kind=8) :: dummy_int

double precision :: cV_mill,m_expected,Omega_m,Omega_l,h,part_exp,divisor,b_factor,mparticles,part_tot
double precision :: dist,ts_modificator,hxsum,hysum,hzsum,hmsum,sidelength,dummy_var
double precision :: logmh,logmfi

double precision, allocatable ::  hm(:)
logical, allocatable :: fi_active(:),fof_used(:),rand_in(:),changed_last(:)
logical :: firstrun
double precision, allocatable :: m_halo_first(:),m_fi_first(:),m_halo_final(:),m_fi_final(:)

real, allocatable ::  h_r(:),hx(:),hy(:),hz(:),rx(:),ry(:),rz(:)
real :: distance
! 
double precision, dimension(1:3) :: Yvector
double precision, dimension(1:3,1:3) :: Amatrix
double precision, dimension(1:3,1:3,1:3) :: Bmatrices
double precision, dimension(1:3) :: solution_first,errorbar_first,solution_final,errorbar_final
double precision, allocatable :: datalist_first(:,:),datalist_final(:,:)
double precision, allocatable :: deviation_first(:),deviation_final(:)
double precision :: rms,det_A,otherside,gal_redshift,gal_dist_c,zmin,zmax,rms_final,rms_first
double precision, dimension(1:3) :: det_B
double precision, dimension(1:3,1:3) :: help_matrix
double precision, dimension(1:2,1:2) :: help_submatrix

double precision :: det2d,det3d


character(1) :: mn

integer, dimension(1:8) :: u_array
integer, dimension(1:1) :: u_local
integer :: u

!parallization variables		
integer ierr, rankrank, nbnodes, namelen
 character (len=MPI_MAX_PROCESSOR_NAME) :: name
!parallization procedures
call MPI_INIT(ierr)
call MPI_COMM_RANK(MPI_COMM_WORLD, rankrank, ierr)
call MPI_COMM_SIZE(MPI_COMM_WORLD, nbnodes, ierr)
call MPI_GET_PROCESSOR_NAME(name, namelen, ierr)	


WRITE(*,*) '============================================================'
WRITE(*,*) '    programme FINITE INFINITY CORRECTIONS started'
WRITE(*,*) '============================================================'

 CALL SYSTEM_CLOCK(hcount)
 hcount=hcount-INT(DBLE(hcount)/100000.D0)*100000
 CALL srand(hcount) 

! define constants
PI=ACOS(-1.D0)


OPEN(87,file='info_file.txt')




! ! get length of file
OPEN(50,file='dark/final_masses_fi.txt')
io_err=0
n_mfi_final=0
DO WHILE (io_err==0) 
READ(50,*,iostat=io_err) 
n_mfi_final=n_mfi_final+1
END DO
 CLOSE(50)
n_mfi_final=n_mfi_final-1

! get length of file
OPEN(50,file='dark/first_masses_fi.txt')
io_err=0
n_mfi_first=0
DO WHILE (io_err==0) 
READ(50,*,iostat=io_err) 
n_mfi_first=n_mfi_first+1
END DO
 CLOSE(50)
n_mfi_first=n_mfi_first-1


allocate(m_halo_first(1:n_mfi_first))
allocate(m_fi_first(1:n_mfi_first))
allocate(m_halo_final(1:n_mfi_final))
allocate(m_fi_final(1:n_mfi_final))

allocate(datalist_final(1:4,1:n_mfi_final))
allocate(deviation_final(1:n_mfi_final))
allocate(datalist_first(1:4,1:n_mfi_first))
allocate(deviation_first(1:n_mfi_first))

 OPEN(50,file='dark/first_masses_fi.txt')
DO i=1,n_mfi_first
READ(50,*)  m_halo_first(i),m_fi_first(i)
END DO
 CLOSE(50)

 
 OPEN(50,file='dark/final_masses_fi.txt')
DO i=1,n_mfi_final
READ(50,*) m_halo_final(i),m_fi_final(i)
END DO
 CLOSE(50)

 

 DO i=1,n_mfi_first
m_halo_first(i)=LOG10(m_halo_first(i))
m_fi_first(i)=LOG10(m_fi_first(i))
END DO 
  
  DO i=1,n_mfi_final
m_halo_final(i)=LOG10(m_halo_final(i))
m_fi_final(i)=LOG10(m_fi_final(i))
END DO

 
 
!  
!  
 

DO i=1,n_mfi_first
datalist_first(1,i)=m_fi_first(i)
datalist_first(2,i)=m_halo_first(i)**2
datalist_first(3,i)=m_halo_first(i)
datalist_first(4,i)=1.D0
END DO
 
  DO i=1,3
 Yvector(i)=0.D0
 DO ii=1,3
 Amatrix(i,ii)=0.D0
 DO iii=1,3
 Bmatrices(i,ii,iii)=0.D0 
 END DO
 END DO
 END DO
!  
 DO i=1,n_mfi_first
 
 DO ii=1,3
 DO iii=1,3
 Amatrix(ii,iii)=Amatrix(ii,iii)+datalist_first(ii+1,i)*datalist_first(iii+1,i)
 END DO
 END DO
 
 DO ii=1,3
 Yvector(ii)=Yvector(ii)+datalist_first(1,i)*datalist_first(ii+1,i)
 END DO
 
 END DO
 
 det_A=det3d(Amatrix)       !                    determinate

DO iii=1,3
DO i=1,3
DO ii=1,3
Bmatrices(i,ii,iii)=Amatrix(i,ii)
END DO
END DO
END DO

DO iii=1,3
DO i=1,3
Bmatrices(iii,i,iii)=Yvector(i)
END DO
END DO

DO iii=1,3
DO i=1,3
DO ii=1,3
help_matrix(i,ii)=Bmatrices(i,ii,iii)
END DO
END DO
det_B(iii)=det3d(help_matrix)                           ! determinate
END DO


DO iii=1,3
solution_first(iii)=det_B(iii)/det_A
END DO
! get solutions


! propagation of error
!root mean square
rms=0.D0


DO i=1,n_mfi_first

otherside=0.D0
DO ii=1,3
otherside=otherside+solution_first(ii)*datalist_first(ii+1,i)
END DO 

deviation_first(i)=otherside-datalist_first(1,i)
rms=rms+(deviation_first(i)**2)

END DO
rms_first=SQRT(rms/DBLE(n_mfi_first))


! error of fitting parameters

DO i=1,3

hc1=0
DO ii=1,3
IF (ii.NE.i) THEN
hc1=hc1+1
hc2=0
DO iii=1,3
IF (iii.NE.i) THEN
hc2=hc2+1
help_submatrix(hc1,hc2)=Amatrix(ii,iii)
END IF
END DO
END IF
END DO


errorbar_first(i)=det2d(help_submatrix)/det_A            !subdeterminate

errorbar_first(i)=SQRT(errorbar_first(i))*rms_first
END DO

 


DO i=1,n_mfi_final
datalist_final(1,i)=m_fi_final(i)
datalist_final(2,i)=m_halo_final(i)**2
datalist_final(3,i)=m_halo_final(i)
datalist_final(4,i)=1.D0
END DO
 
  DO i=1,3
 Yvector(i)=0.D0
 DO ii=1,3
 Amatrix(i,ii)=0.D0
 DO iii=1,3
 Bmatrices(i,ii,iii)=0.D0 
 END DO
 END DO
 END DO
 
 DO i=1,n_mfi_final
 
 DO ii=1,3
 DO iii=1,3
 Amatrix(ii,iii)=Amatrix(ii,iii)+datalist_final(ii+1,i)*datalist_final(iii+1,i)
 END DO
 END DO
 
 DO ii=1,3
 Yvector(ii)=Yvector(ii)+datalist_final(1,i)*datalist_final(ii+1,i)
 END DO
 
 END DO
 
 det_A=det3d(Amatrix)       !                    determinate

DO iii=1,3
DO i=1,3
DO ii=1,3
Bmatrices(i,ii,iii)=Amatrix(i,ii)
END DO
END DO
END DO

DO iii=1,3
DO i=1,3
Bmatrices(iii,i,iii)=Yvector(i)
END DO
END DO

DO iii=1,3
DO i=1,3
DO ii=1,3
help_matrix(i,ii)=Bmatrices(i,ii,iii)
END DO
END DO
det_B(iii)=det3d(help_matrix)                           ! determinate
END DO


DO iii=1,3
solution_final(iii)=det_B(iii)/det_A
END DO
! get solutions


! propagation of error
!root mean square
rms=0.D0


DO i=1,n_mfi_final

otherside=0.D0
DO ii=1,3
otherside=otherside+solution_final(ii)*datalist_final(ii+1,i)
END DO 

deviation_final(i)=otherside-datalist_final(1,i)
rms=rms+(deviation_final(i)**2)

END DO
rms_final=SQRT(rms/DBLE(n_mfi_final))


! error of fitting parameters

DO i=1,3

hc1=0
DO ii=1,3
IF (ii.NE.i) THEN
hc1=hc1+1
hc2=0
DO iii=1,3
IF (iii.NE.i) THEN
hc2=hc2+1
help_submatrix(hc1,hc2)=Amatrix(ii,iii)
END IF
END DO
END IF
END DO


errorbar_final(i)=det2d(help_submatrix)/det_A            !subdeterminate

errorbar_final(i)=SQRT(errorbar_final(i))*rms_final
END DO

 
 
  OPEN(61,file='fi_fit_para_all_dark.txt')
WRITE(61,*) solution_first(1:3)
WRITE(61,*) errorbar_first(1:3)
WRITE(61,*) rms_first
WRITE(61,*)
WRITE(61,*) solution_final(1:3)
WRITE(61,*) errorbar_final(1:3)
WRITE(61,*) rms_final
 CLOSE(61)
 
 
 

 
 OPEN(61,file='fi_fit_para_dark.txt')
WRITE(61,*) 'a_first_1=',solution_first(1)
WRITE(61,*) 'a_first_2=',solution_first(2)
WRITE(61,*) 'a_first_3=',solution_first(3)
WRITE(61,*) 'a_final_1=',solution_final(1)
WRITE(61,*) 'a_final_2=',solution_final(2)
WRITE(61,*) 'a_final_3=',solution_final(3)
 CLOSE(61)
 


 
 


DO u=1,8
u_array(u)=u
END DO

call MPI_Scatter(u_array,1,MPI_INTEGER,u_local,1,MPI_INTEGER,0,MPI_COMM_WORLD,ierr)

uuu=u_local(1)

IF (uuu==1) THEN
mn='1'
END IF
IF (uuu==2) THEN
mn='2'
END IF
IF (uuu==3) THEN
mn='3'
END IF
IF (uuu==4) THEN
mn='4'
END IF
IF (uuu==5) THEN
mn='5'
END IF
IF (uuu==6) THEN
mn='6'
END IF
IF (uuu==7) THEN
mn='7'
END IF
IF (uuu==8) THEN
mn='8'
END IF



Omega_m=0.25D0
Omega_l=0.75D0

sidelength=400.D0
q0=Omega_m/2.D0-Omega_l
light=3.D5
tophat=200.D0
H0=73.D0
h=H0/100.D0
G=4.302D-9 !in Mpc/Msol * (km/s)**2
rho_crit=3.D0*((H0)**2)/(8.D0*PI*G)
! WRITE(*,*) rho_crit
ts_modificator=(50.1D0/61.7D0)**2

 cV_mill=(sidelength/h)**3
m_expected=cV_mill*rho_crit*Omega_m

! mag_sol_r=4.76D0
! mag_sol_Ks=3.27D0
! WRITE(*,*) m_expected


! part_exp=(270.D0**3)
! mparticles=8.61D8/h
! 
! m_expected=mparticles*part_exp

! WRITE(*,*) m_expected

! get length of file
OPEN(50,file='fi_dark/fi_regions_true_mock'//TRIM(mn)//'.txt')
io_err=0
n_h=0
DO WHILE (io_err==0) 
READ(50,*,iostat=io_err) 
n_h=n_h+1
END DO
 CLOSE(50)
n_h=n_h-1

WRITE(*,*) n_h,'fof groups will be used',uuu
WRITE(87,*)  n_h,'fof groups will be used',uuu

allocate(hx(1:n_h))
allocate(hy(1:n_h))
allocate(hz(1:n_h))
allocate(h_r(1:n_h))
allocate(hm(1:n_h))



allocate(fi_active(1:n_h))
allocate(changed_last(1:n_h))
allocate(fof_used(1:n_h))


n_r=1000000
allocate(rand_in(1:n_r))

allocate(rx(1:n_r))
allocate(ry(1:n_r))
allocate(rz(1:n_r))


DO i=1,n_r
rand_in(i)=.FALSE.
rx(i)=(sidelength/h)*RAND()-(10.D0/h)
ry(i)=(sidelength/h)*RAND()-(10.D0/h)
rz(i)=(sidelength/h)*RAND()-(10.D0/h)
END DO


hhhhh=n_h

! read file
OPEN(50,file='fi_dark/fi_regions_true_mock'//TRIM(mn)//'.txt')
DO i=1,n_h
READ(50,*) hx(i),hy(i),hz(i),hm(i),dummy_var
END DO
CLOSE(50)

DO i=1,n_h
fi_active(i)=.TRUE.
 changed_last(i)=.TRUE.
fof_used(i)=.FALSE.
hm(i)=10.D0**hm(i)
h_r(i)=(3.D0/(4.D0*PI)*hm(i)/(rho_crit*ts_modificator))**(1.D0/3.D0)
! hr2(i)=h_r(i)**2
END DO


! DO i=1,1000
! WRITE(*,*) h_r(i)
! END DO

n_active=n_h
n_active_old=0
itercount=0
firstrun=.TRUE.



hmsum=0.D0
DO i=1,n_h
IF (fi_active(i)) THEN
hmsum=hmsum+hm(i)
END IF
END DO




rescale=hmsum/m_expected
WRITE(*,*) rescale,uuu
WRITE(87,*) rescale,uuu

DO i=1,n_h
IF (fi_active(i)) THEN
hm(i)=hm(i)/rescale
h_r(i)=(3.D0/(4.D0*PI)*hm(i)/(rho_crit*ts_modificator))**(1.D0/3.D0)
END IF
END DO



DO i=1,n_h
IF (fi_active(i)) THEN
WRITE(*,*) i,n_active,uuu
! hr2(i)=h_r(i)**2
n_used=1

DO ii=1,n_h
fof_used(ii)=.FALSE.
IF (fi_active(ii)) THEN
IF (ii.NE.i) THEN

IF (ABS(hx(i)-hx(ii))<(h_r(i)-h_r(ii))) THEN
IF (ABS(hy(i)-hy(ii))<(h_r(i)-h_r(ii))) THEN
IF (ABS(hz(i)-hz(ii))<(h_r(i)-h_r(ii))) THEN

distance=SQRT((hx(i)-hx(ii))**2+(hy(i)-hy(ii))**2+(hz(i)-hz(ii))**2)


IF ((distance+h_r(ii))<h_r(i)) THEN
fof_used(ii)=.TRUE.
fi_active(ii)=.FALSE.
n_used=n_used+1
END IF

END IF
END IF
END IF

END IF
END IF
END DO





IF (n_used>1) THEN

hmsum=hm(i)
hxsum=hx(i)*hm(i)
hysum=hy(i)*hm(i)
hzsum=hz(i)*hm(i)


DO ii=i,n_h
IF (fof_used(ii)) THEN
hmsum=hmsum+hm(ii)
hxsum=hxsum+hx(ii)*hm(ii)
hysum=hysum+hy(ii)*hm(ii)
hzsum=hzsum+hz(ii)*hm(ii)
fof_used(ii)=.FALSE.
END IF
END DO



hm(i)=hmsum
hx(i)=hxsum/hmsum
hy(i)=hysum/hmsum
hz(i)=hzsum/hmsum

h_r(i)=(3.D0/(4.D0*PI)*hm(i)/(rho_crit*ts_modificator))**(1.D0/3.D0)

END IF


END IF
END DO


n_active=0
DO i=1,n_h
IF (fi_active(i)) THEN
n_active=n_active+1
END IF
END DO


WRITE(*,*) n_active,uuu
WRITE(87,*) n_active,uuu


OPEN(50,file='fi_dark/fi_regions_truefullmass_mock'//TRIM(mn)//'.txt')
DO i=1,n_h
IF (fi_active(i)) THEN
WRITE(50,*) hx(i),hy(i),hz(i),LOG10(hm(i)),h_r(i)
END IF
END DO
CLOSE(50)



DO i=1,n_r
rand_in(i)=.FALSE.
DO ii=1,n_h
IF (fi_active(ii)) THEN
distance=(hx(ii)-rx(i))**2+(hy(ii)-ry(i))**2+(hz(ii)-rz(i))**2
IF (distance<(h_r(ii)**2)) THEN
rand_in(i)=.TRUE.
END IF
END IF
END DO
END DO

n_infi=0
DO i=1,n_r
IF (rand_in(i)) THEN
n_infi=n_infi+1
END IF
END DO

WRITE(*,*) DBLE(n_infi)/DBLE(n_r)*100.D0,uuu
WRITE(87,*) DBLE(n_infi)/DBLE(n_r)*100.D0,uuu



deallocate(hx)
deallocate(hy)
deallocate(hz)
deallocate(h_r)
deallocate(hm)
deallocate(fi_active)
deallocate(fof_used)
deallocate(rand_in)
deallocate(rx)
deallocate(ry)
deallocate(rz)
deallocate(changed_last)


call MPI_AllGather(u_local,1,MPI_INTEGER,u_array,1,MPI_INTEGER,MPI_COMM_WORLD,ierr)

 
!finalize parallization
call MPI_FINALIZE(ierr)


WRITE(*,*) '============================================================'
WRITE(*,*) '    programme complete'
WRITE(*,*) '============================================================'

CLOSE(87)


END PROGRAM








double precision FUNCTION det3d(matrix)

double precision, dimension(1:3,1:3) :: matrix
double precision :: helpsum

 helpsum=matrix(1,1)*matrix(2,2)*matrix(3,3)
helpsum=helpsum+matrix(2,1)*matrix(3,2)*matrix(1,3)
helpsum=helpsum+matrix(1,2)*matrix(2,3)*matrix(3,1)
helpsum=helpsum-matrix(1,3)*matrix(2,2)*matrix(3,1)
helpsum=helpsum-matrix(2,1)*matrix(1,2)*matrix(3,3)
helpsum=helpsum-matrix(2,3)*matrix(3,2)*matrix(1,1)

 IF (IsNaN(helpsum)) THEN
 WRITE(*,*) 'error in det3d'
 END IF 
 


 det3d=helpsum

! 
RETURN
END FUNCTION det3d

 
 
double precision FUNCTION det2d(matrix)

double precision, dimension(1:2,1:2) :: matrix
double precision :: helpsum

 helpsum=matrix(1,1)*matrix(2,2)-matrix(1,2)*matrix(2,1)

 IF (IsNaN(helpsum)) THEN
 WRITE(*,*) 'error in det2d'
 END IF 
 
 det2d=helpsum

! 
RETURN
END FUNCTION det2d

