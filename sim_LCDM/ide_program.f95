PROGRAM identify_ellipticals
! declaration of variables
IMPLICIT NONE
double precision :: PI,H0,q0,light,G,rho_crit,ts_modificator
integer :: io_err,i,ii,n,r_seed,h_count,nnn
double precision :: cV_mill,m_expected,Omega_m,Omega_l,h,part_exp,divisor,dummy_var,binhelp
double precision :: cc1,cc2,cc3,cmd_rms,masspart

double precision, allocatable :: gal_mvir(:),gal_coldGas(:),gal_sfr(:),gal_massWeightedAge(:)
double precision, allocatable :: gal_gDust(:),gal_rDust(:),gal_zDust(:)
integer(kind=8), allocatable :: gal_np(:),snapnum(:)
double precision, allocatable :: gal_ratio_coldgas(:),gal_ratio_sfr(:),gal_ratio_colour(:)
double precision, allocatable :: gal_ratio_gas_star(:),gal_ratio_bulge_star(:),gal_ratio_disk_gas_star(:)
double precision, allocatable :: log_gal_ratio_gas_star(:),log_gal_ratio_bulge_star(:),log_gal_ratio_disk_gas_star(:)
double precision, allocatable :: log_gal_ratio_coldgas(:),log_gal_ratio_sfr(:),log_gal_mvir(:),gal_mass(:)
double precision, allocatable :: log_gal_ratio_bulge_disk(:),gal_ratio_bulge_disk(:)
double precision, allocatable :: gal_bulgeMass(:),gal_stellarMass(:),gal_bulgeSize(:),gal_log_mass(:)
double precision, allocatable :: gal_stellarDiskRadius(:),gal_gasDiskRadius(:)
logical, allocatable :: active(:)

double precision, dimension(0:100) :: plot_bin
double precision, dimension(0:500,0:500) :: mapmap
double precision :: help_x2,help_y2
integer :: help_x,help_y


WRITE(*,*) '============================================================'
WRITE(*,*) '    programme PREPARE TEST started'
WRITE(*,*) '============================================================'


! define constants
PI=ACOS(-1.D0)

Omega_m=0.25D0
Omega_l=0.75D0
H0=73.D0

q0=Omega_m/2.D0-Omega_l
light=3.D5
h=H0/100.D0
G=4.302D-3 !in pc/Msol * (km/s)**2
rho_crit=3.D0*((1.D-6*H0)**2)/(8.D0*PI*G)

 masspart=8.61D8/1.D10


 OPEN(52,file='prepare/redsequence.txt')

READ(52,*) cc1
READ(52,*) cc2
READ(52,*) cc3
READ(52,*) cmd_rms

 CLOSE(52)
 

! get length of file
OPEN(50,file='prepare/data_ell.txt')
io_err=0
n=0
DO WHILE (io_err==0) 
READ(50,*,iostat=io_err) 
n=n+1
END DO
 CLOSE(50)
n=n-1


allocate(gal_mvir(1:n))
allocate(gal_coldGas(1:n))
allocate(gal_sfr(1:n))
allocate(gal_massWeightedAge(1:n))
allocate(gal_gDust(1:n))
allocate(gal_rDust(1:n))
allocate(gal_zDust(1:n))
allocate(gal_np(1:n))
allocate(snapnum(1:n))

allocate(gal_ratio_coldgas(1:n))
allocate(gal_ratio_sfr(1:n))
allocate(gal_ratio_colour(1:n))
allocate(log_gal_ratio_coldgas(1:n))
allocate(log_gal_ratio_sfr(1:n))
allocate(log_gal_mvir(1:n))
allocate(gal_log_mass(1:n))
allocate(gal_mass(1:n))
allocate(gal_bulgeMass(1:n))
allocate(gal_stellarMass(1:n))
allocate(gal_bulgeSize(1:n))
allocate(gal_stellarDiskRadius(1:n))
allocate(gal_gasDiskRadius(1:n))

allocate(gal_ratio_gas_star(1:n))
allocate(gal_ratio_bulge_star(1:n))
allocate(gal_ratio_disk_gas_star(1:n))
allocate(log_gal_ratio_gas_star(1:n))
allocate(log_gal_ratio_bulge_star(1:n))
allocate(log_gal_ratio_disk_gas_star(1:n))

allocate(log_gal_ratio_bulge_disk(1:n))
allocate(gal_ratio_bulge_disk(1:n))

allocate(active(1:n))




OPEN(50,file='prepare/data_ell.txt')
 DO i=1,n
READ(50,*) snapnum(i),gal_np(i),gal_mvir(i),gal_coldGas(i),gal_sfr(i),gal_massWeightedAge(i),&
gal_gDust(i),gal_rDust(i),gal_zDust(i),&
gal_bulgeMass(i),gal_stellarMass(i),gal_bulgeSize(i),gal_stellarDiskRadius(i),gal_gasDiskRadius(i)
 END DO
 CLOSE(50)

  DO i=1,n
  gal_mass(i)=DBLE(gal_np(i))*masspart
gal_log_mass(i)=LOG10(gal_mass(i))
gal_ratio_coldgas(i)=gal_coldGas(i)/gal_mass(i)
gal_ratio_sfr(i)=gal_sfr(i)/gal_mass(i)
gal_ratio_colour(i)=gal_gDust(i)-gal_rDust(i)

gal_ratio_gas_star(i)=gal_coldGas(i)/gal_stellarmass(i)
gal_ratio_bulge_star(i)=gal_bulgeMass(i)/gal_stellarmass(i)
gal_ratio_disk_gas_star(i)=gal_gasDiskRadius(i)/gal_stellarDiskRadius(i)
gal_ratio_bulge_disk(i)=gal_bulgeSize(i)/gal_stellarDiskRadius(i)

log_gal_ratio_bulge_disk(i)=LOG10(gal_ratio_bulge_disk(i))
log_gal_ratio_gas_star(i)=LOG10(gal_ratio_gas_star(i))
log_gal_ratio_bulge_star(i)=LOG10(gal_ratio_bulge_star(i))
log_gal_ratio_disk_gas_star(i)=LOG10(gal_ratio_disk_gas_star(i))
log_gal_ratio_coldgas(i)=LOG10(gal_ratio_coldgas(i))
log_gal_ratio_sfr(i)=LOG10(gal_ratio_sfr(i))
log_gal_mvir(i)=LOG10(gal_mvir(i))
END DO
 
 h_count=n
 WRITE(*,*) h_count,'galaxies brighter than -18 mag'
 
DO i=0,100
plot_bin(i)=0.D0
END DO
 
 
DO i=1,n
DO ii=0,100
binhelp=DBLE(-ii)/20.D0
IF ((log_gal_ratio_coldgas(i)>(binhelp-0.025)).AND.(log_gal_ratio_coldgas(i)<(binhelp+0.025))) THEN
plot_bin(ii)=plot_bin(ii)+1.D0
END IF
END DO
END DO

DO i=0,100
plot_bin(i)=plot_bin(i)/DBLE(n)
END DO
 
OPEN(70,file='prepare/log_coldgas.txt')
DO i=0,100
binhelp=DBLE(-i)/20.D0
WRITE(70,*) binhelp,plot_bin(i)
END DO
 CLOSE (70)
 
 
 
 DO i=0,100
plot_bin(i)=0.D0
END DO
 
 
DO i=1,n
DO ii=0,100
binhelp=DBLE(-ii)/10.D0
IF ((log_gal_ratio_sfr(i)>(binhelp-0.05)).AND.(log_gal_ratio_sfr(i)<(binhelp+0.05))) THEN
plot_bin(ii)=plot_bin(ii)+1.D0
END IF
END DO
END DO

DO i=0,100
plot_bin(i)=plot_bin(i)/DBLE(n)
END DO
 
OPEN(70,file='prepare/log_sfr.txt')
DO i=0,100
binhelp=DBLE(-i)/10.D0
WRITE(70,*) binhelp,plot_bin(i)
END DO
 CLOSE (70)
 
 
 DO i=0,100
plot_bin(i)=0.D0
END DO
 
 
DO i=1,n
DO ii=0,100
binhelp=DBLE(ii)/5.D0
IF ((gal_massWeightedAge(i)>(binhelp-0.1)).AND.(gal_massWeightedAge(i)<(binhelp+0.1))) THEN
plot_bin(ii)=plot_bin(ii)+1.D0
END IF
END DO
END DO

DO i=0,100
plot_bin(i)=plot_bin(i)/DBLE(n)
END DO
 
OPEN(70,file='prepare/age.txt')
DO i=0,100
binhelp=DBLE(i)/5.D0
WRITE(70,*) binhelp,plot_bin(i)
END DO
 CLOSE (70) 

 
DO i=0,500
DO ii=0,500
mapmap(i,ii)=0
END DO
END DO

DO i=1,n
help_x=NINT((-gal_zDust(i)-18.D0)*50.D0)
help_y=NINT(((gal_gDust(i)-gal_rDust(i))+2.D0)*100.D0)
IF ((help_x>0).AND.(help_x<500)) THEN
IF ((help_y>0).AND.(help_y<400)) THEN
mapmap(help_x,help_y)=mapmap(help_x,help_y)+1
END IF
END IF
END DO

OPEN(61,file='prepare/CMD_map.txt')
DO i=0,500
DO ii=0,400
help_x2=-(DBLE(i)/50.D0)-18.D0
help_y2=(DBLE(ii)/100.D0)-2.D0
WRITE(61,*) help_x2,help_y2,LOG10(mapmap(i,ii)+1)
END DO
END DO
 CLOSE(61)

 
 
 
 DO i=0,100
plot_bin(i)=0.D0
END DO
 
 
DO i=1,n
DO ii=0,100
binhelp=DBLE(ii)/20.D0
IF ((log_gal_mvir(i)>(binhelp-0.025)).AND.(log_gal_mvir(i)<(binhelp+0.025))) THEN
plot_bin(ii)=plot_bin(ii)+1.D0
END IF
END DO
END DO

DO i=0,100
plot_bin(i)=plot_bin(i)/DBLE(n)
END DO
 
OPEN(70,file='prepare/mvir.txt')
DO i=0,100
binhelp=DBLE(i)/20.D0
WRITE(70,*) binhelp,plot_bin(i)
END DO
 CLOSE (70) 

 
 
  
 DO i=0,100
plot_bin(i)=0.D0
END DO
 
 
DO i=1,n
DO ii=0,100
binhelp=DBLE(ii)/20.D0
IF ((gal_log_mass(i)>(binhelp-0.025)).AND.(gal_log_mass(i)<(binhelp+0.025))) THEN
plot_bin(ii)=plot_bin(ii)+1.D0
END IF
END DO
END DO

DO i=0,100
plot_bin(i)=plot_bin(i)/DBLE(n)
END DO
 
OPEN(70,file='prepare/mass.txt')
DO i=0,100
binhelp=DBLE(i)/20.D0
WRITE(70,*) binhelp,plot_bin(i)
END DO
 CLOSE (70) 

 
 


 
 

 
DO i=0,100
plot_bin(i)=0.D0
END DO
 
 
DO i=1,n
DO ii=0,100
binhelp=(DBLE(-ii)/20.D0)+2.D0
IF ((log_gal_ratio_disk_gas_star(i)>(binhelp-0.025)).AND.(log_gal_ratio_disk_gas_star(i)<(binhelp+0.025))) THEN
plot_bin(ii)=plot_bin(ii)+1.D0
END IF
END DO
END DO

DO i=0,100
plot_bin(i)=plot_bin(i)/DBLE(n)
END DO
 
OPEN(70,file='prepare/log_disk_gas.txt')
DO i=0,100
binhelp=(DBLE(-i)/20.D0)+2.D0
WRITE(70,*) binhelp,plot_bin(i)
END DO
 CLOSE (70)
 
 
 
 
 
 
DO i=0,100
plot_bin(i)=0.D0
END DO
 
 
DO i=1,n
DO ii=0,100
binhelp=(DBLE(-ii)/20.D0)+0.1D0
IF ((log_gal_ratio_bulge_star(i)>(binhelp-0.025)).AND.(log_gal_ratio_bulge_star(i)<(binhelp+0.025))) THEN
plot_bin(ii)=plot_bin(ii)+1.D0
END IF
END DO
END DO

DO i=0,100
plot_bin(i)=plot_bin(i)/DBLE(n)
END DO
 
OPEN(70,file='prepare/log_bulge_star.txt')
DO i=0,100
binhelp=(DBLE(-i)/20.D0)+0.1D0
WRITE(70,*) binhelp,plot_bin(i)
END DO
 CLOSE (70)
 
 
 
 
 
  DO i=0,100
plot_bin(i)=0.D0
END DO
 
 
DO i=1,n
DO ii=0,100
binhelp=(DBLE(-ii)/10.D0)+4.D0
IF ((log_gal_ratio_gas_star(i)>(binhelp-0.05)).AND.(log_gal_ratio_gas_star(i)<(binhelp+0.05))) THEN
plot_bin(ii)=plot_bin(ii)+1.D0
END IF
END DO
END DO

DO i=0,100
plot_bin(i)=plot_bin(i)/DBLE(n)
END DO
 
OPEN(70,file='prepare/log_gas_star.txt')
DO i=0,100
binhelp=(DBLE(-i)/10.D0)+4.D0
WRITE(70,*) binhelp,plot_bin(i)
END DO
 CLOSE (70)
 
 
 

 DO i=0,100
plot_bin(i)=0.D0
END DO
 
 
DO i=1,n
DO ii=0,100
binhelp=(DBLE(-ii)/10.D0)+6.D0
IF ((log_gal_ratio_bulge_disk(i)>(binhelp-0.05)).AND.(log_gal_ratio_bulge_disk(i)<(binhelp+0.05))) THEN
plot_bin(ii)=plot_bin(ii)+1.D0
END IF
END DO
END DO

DO i=0,100
plot_bin(i)=plot_bin(i)/DBLE(n)
END DO
 
OPEN(70,file='prepare/log_bulge_disk.txt')
DO i=0,100
binhelp=(DBLE(-i)/10.D0)+6.D0
WRITE(70,*) binhelp,plot_bin(i)
END DO
 CLOSE (70)
 
 
 
  
DO i=1,n
DO ii=0,100
binhelp=(DBLE(-ii)/10.D0)-18.D0
IF ((gal_rdust(i)>(binhelp-0.05)).AND.(gal_rdust(i)<(binhelp+0.05))) THEN
plot_bin(ii)=plot_bin(ii)+1.D0
END IF
END DO
END DO

DO i=0,100
plot_bin(i)=plot_bin(i)/DBLE(n)
END DO
 
OPEN(70,file='prepare/lumfunction.txt')
DO i=0,100
binhelp=(DBLE(-i)/10.D0)-18.D0
WRITE(70,*) binhelp,plot_bin(i)
END DO
 CLOSE (70)
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 DO i=1,n
 active(i)=.TRUE.
 END DO
 
 
  DO i=1,n
IF ((gal_gDust(i)-gal_rDust(i))<0.65D0) THEN
 active(i)=.FALSE.
END IF
 END DO
 
 ! 2-sigma red sequence
 
!  DO i=1,n
! IF (active(i)) THEN
! dummy_var=cc1*((gal_zDust(i))**2)+cc2*(gal_zDust(i))+cc3-2.D0*cmd_rms
! IF ((gal_gDust(i)-gal_rDust(i))<dummy_var) THEN
! active(i)=.FALSE.
! END IF
! END IF
! END DO
 
 
 
   h_count=0
 DO i=1,n
 IF (active(i)) THEN
 h_count=h_count+1
 END IF
 END DO 
 

 WRITE(*,*) h_count,'galaxies redder than 0.65 mag (g-r)'! and on the red sequence'
 
 
 
 
DO i=0,100
plot_bin(i)=0.D0
END DO
 
 
DO i=1,n
IF (active(i)) THEN
DO ii=0,100
binhelp=DBLE(-ii)/20.D0
IF ((log_gal_ratio_coldgas(i)>(binhelp-0.025)).AND.(log_gal_ratio_coldgas(i)<(binhelp+0.025))) THEN
plot_bin(ii)=plot_bin(ii)+1.D0
END IF
END DO
END IF
END DO

DO i=0,100
plot_bin(i)=plot_bin(i)/DBLE(n)
END DO
 
OPEN(70,file='prepare/log_coldgas_cc.txt')
DO i=0,100
binhelp=DBLE(-i)/20.D0
WRITE(70,*) binhelp,plot_bin(i)
END DO
 CLOSE (70)
 
 
 
 DO i=0,100
plot_bin(i)=0.D0
END DO
 
 
DO i=1,n
IF (active(i)) THEN
DO ii=0,100
binhelp=DBLE(-ii)/10.D0
IF ((log_gal_ratio_sfr(i)>(binhelp-0.05)).AND.(log_gal_ratio_sfr(i)<(binhelp+0.05))) THEN
plot_bin(ii)=plot_bin(ii)+1.D0
END IF
END DO
END IF
END DO

DO i=0,100
plot_bin(i)=plot_bin(i)/DBLE(n)
END DO
 
OPEN(70,file='prepare/log_sfr_cc.txt')
DO i=0,100
binhelp=DBLE(-i)/10.D0
WRITE(70,*) binhelp,plot_bin(i)
END DO
 CLOSE (70)
 
 
 DO i=0,100
plot_bin(i)=0.D0
END DO
 
 
DO i=1,n
IF (active(i)) THEN
DO ii=0,100
binhelp=DBLE(ii)/5.D0
IF ((gal_massWeightedAge(i)>(binhelp-0.1)).AND.(gal_massWeightedAge(i)<(binhelp+0.1))) THEN
plot_bin(ii)=plot_bin(ii)+1.D0
END IF
END DO
END IF
END DO

DO i=0,100
plot_bin(i)=plot_bin(i)/DBLE(n)
END DO
 
OPEN(70,file='prepare/age_cc.txt')
DO i=0,100
binhelp=DBLE(i)/5.D0
WRITE(70,*) binhelp,plot_bin(i)
END DO
 CLOSE (70) 

 
DO i=0,500
DO ii=0,500
mapmap(i,ii)=0
END DO
END DO

DO i=1,n
IF (active(i)) THEN
help_x=NINT((-gal_zDust(i)-18.D0)*50.D0)
help_y=NINT(((gal_gDust(i)-gal_rDust(i))+2.D0)*100.D0)
IF ((help_x>0).AND.(help_x<500)) THEN
IF ((help_y>0).AND.(help_y<400)) THEN
mapmap(help_x,help_y)=mapmap(help_x,help_y)+1
END IF
END IF
END IF
END DO

OPEN(61,file='prepare/CMD_map_cc.txt')
DO i=0,500
DO ii=0,400
help_x2=-(DBLE(i)/50.D0)-18.D0
help_y2=(DBLE(ii)/100.D0)-2.D0
WRITE(61,*) help_x2,help_y2,LOG10(mapmap(i,ii)+1)
END DO
END DO
 CLOSE(61)

 
 
 
 DO i=0,100
plot_bin(i)=0.D0
END DO
 
 
DO i=1,n
IF (active(i)) THEN
DO ii=0,100
binhelp=DBLE(ii)/20.D0
IF ((log_gal_mvir(i)>(binhelp-0.025)).AND.(log_gal_mvir(i)<(binhelp+0.025))) THEN
plot_bin(ii)=plot_bin(ii)+1.D0
END IF
END DO
END IF
END DO

DO i=0,100
plot_bin(i)=plot_bin(i)/DBLE(n)
END DO
 
OPEN(70,file='prepare/mvir_cc.txt')
DO i=0,100
binhelp=DBLE(i)/20.D0
WRITE(70,*) binhelp,plot_bin(i)
END DO
 CLOSE (70) 

 
  DO i=0,100
plot_bin(i)=0.D0
END DO
 
  
DO i=1,n
IF (active(i)) THEN
DO ii=0,100
binhelp=DBLE(ii)/20.D0
IF ((gal_log_mass(i)>(binhelp-0.025)).AND.(gal_log_mass(i)<(binhelp+0.025))) THEN
plot_bin(ii)=plot_bin(ii)+1.D0
END IF
END DO
END IF
END DO

DO i=0,100
plot_bin(i)=plot_bin(i)/DBLE(n)
END DO
 
OPEN(70,file='prepare/mass_cc.txt')
DO i=0,100
binhelp=DBLE(i)/20.D0
WRITE(70,*) binhelp,plot_bin(i)
END DO
 CLOSE (70) 

 

 
 

 
DO i=0,100
plot_bin(i)=0.D0
END DO
 
 
DO i=1,n
IF (active(i)) THEN
DO ii=0,100
binhelp=(DBLE(-ii)/20.D0)+3.D0
IF ((log_gal_ratio_disk_gas_star(i)>(binhelp-0.025)).AND.(log_gal_ratio_disk_gas_star(i)<(binhelp+0.025))) THEN
plot_bin(ii)=plot_bin(ii)+1.D0
END IF
END DO
END IF
END DO

DO i=0,100
plot_bin(i)=plot_bin(i)/DBLE(n)
END DO
 
OPEN(70,file='prepare/log_disk_gas_cc.txt')
DO i=0,100
binhelp=(DBLE(-i)/20.D0)+3.D0
WRITE(70,*) binhelp,plot_bin(i)
END DO
 CLOSE (70)
 
 
 
 
 
 
DO i=0,100
plot_bin(i)=0.D0
END DO
 
 
DO i=1,n
IF (active(i)) THEN
DO ii=0,100
binhelp=(DBLE(-ii)/20.D0)+0.1D0
IF ((log_gal_ratio_bulge_star(i)>(binhelp-0.025)).AND.(log_gal_ratio_bulge_star(i)<(binhelp+0.025))) THEN
plot_bin(ii)=plot_bin(ii)+1.D0
END IF
END DO
END IF
END DO

DO i=0,100
plot_bin(i)=plot_bin(i)/DBLE(n)
END DO
 
OPEN(70,file='prepare/log_bulge_star_cc.txt')
DO i=0,100
binhelp=(DBLE(-i)/20.D0)+0.1D0
WRITE(70,*) binhelp,plot_bin(i)
END DO
 CLOSE (70)
 
 
 
 
 
  DO i=0,100
plot_bin(i)=0.D0
END DO
 
 
DO i=1,n
IF (active(i)) THEN
DO ii=0,100
binhelp=(DBLE(-ii)/10.D0)+4.D0
IF ((log_gal_ratio_gas_star(i)>(binhelp-0.05)).AND.(log_gal_ratio_gas_star(i)<(binhelp+0.05))) THEN
plot_bin(ii)=plot_bin(ii)+1.D0
END IF
END DO
END IF
END DO

DO i=0,100
plot_bin(i)=plot_bin(i)/DBLE(n)
END DO
 
OPEN(70,file='prepare/log_gas_star_cc.txt')
DO i=0,100
binhelp=(DBLE(-i)/10.D0)+4.D0
WRITE(70,*) binhelp,plot_bin(i)
END DO
 CLOSE (70)
 
 
 

 DO i=0,100
plot_bin(i)=0.D0
END DO
 
 
DO i=1,n
IF (active(i)) THEN
DO ii=0,100
binhelp=(DBLE(-ii)/10.D0)+6.D0
IF ((log_gal_ratio_bulge_disk(i)>(binhelp-0.05)).AND.(log_gal_ratio_bulge_disk(i)<(binhelp+0.05))) THEN
plot_bin(ii)=plot_bin(ii)+1.D0
END IF
END DO
END IF
END DO

DO i=0,100
plot_bin(i)=plot_bin(i)/DBLE(n)
END DO
 
OPEN(70,file='prepare/log_bulge_disk_cc.txt')
DO i=0,100
binhelp=(DBLE(-i)/10.D0)+6.D0
WRITE(70,*) binhelp,plot_bin(i)
END DO
 CLOSE (70)
 
 
 
   
DO i=1,n
IF (active(i)) THEN
DO ii=0,100
binhelp=(DBLE(-ii)/10.D0)-18.D0
IF ((gal_rdust(i)>(binhelp-0.05)).AND.(gal_rdust(i)<(binhelp+0.05))) THEN
plot_bin(ii)=plot_bin(ii)+1.D0
END IF
END DO
END IF
END DO

DO i=0,100
plot_bin(i)=plot_bin(i)/DBLE(n)
END DO
 
OPEN(70,file='prepare/lumfunction_cc.txt')
DO i=0,100
binhelp=(DBLE(-i)/10.D0)-18.D0
WRITE(70,*) binhelp,plot_bin(i)
END DO
 CLOSE (70)
 
 
 
 
 
 
!  
!   DO i=1,n
! IF ((log_gal_ratio_bulge_star(i))<-0.1D0) THEN
!  active(i)=.FALSE.
! END IF
!  END DO
!  
!  
 
  DO i=1,n
IF ((log_gal_ratio_coldgas(i))>-3.09691D0) THEN
 active(i)=.FALSE.
END IF
 END DO
 
 
 
    h_count=0
 DO i=1,n
 IF (active(i)) THEN
 h_count=h_count+1
 END IF
 END DO 
 

 WRITE(*,*) h_count,'galaxies low in cold gas'
 
 
 
 
 
 
DO i=0,100
plot_bin(i)=0.D0
END DO
 
 
DO i=1,n
IF (active(i)) THEN
DO ii=0,100
binhelp=DBLE(-ii)/20.D0
IF ((log_gal_ratio_coldgas(i)>(binhelp-0.025)).AND.(log_gal_ratio_coldgas(i)<(binhelp+0.025))) THEN
plot_bin(ii)=plot_bin(ii)+1.D0
END IF
END DO
END IF
END DO

DO i=0,100
plot_bin(i)=plot_bin(i)/DBLE(n)
END DO
 
OPEN(70,file='prepare/log_coldgas_cc_bc.txt')
DO i=0,100
binhelp=DBLE(-i)/20.D0
WRITE(70,*) binhelp,plot_bin(i)
END DO
 CLOSE (70)
 
 
 
 DO i=0,100
plot_bin(i)=0.D0
END DO
 
 
DO i=1,n
IF (active(i)) THEN
DO ii=0,100
binhelp=DBLE(-ii)/10.D0
IF ((log_gal_ratio_sfr(i)>(binhelp-0.05)).AND.(log_gal_ratio_sfr(i)<(binhelp+0.05))) THEN
plot_bin(ii)=plot_bin(ii)+1.D0
END IF
END DO
END IF
END DO

DO i=0,100
plot_bin(i)=plot_bin(i)/DBLE(n)
END DO
 
OPEN(70,file='prepare/log_sfr_cc_bc.txt')
DO i=0,100
binhelp=DBLE(-i)/10.D0
WRITE(70,*) binhelp,plot_bin(i)
END DO
 CLOSE (70)
 
 
 DO i=0,100
plot_bin(i)=0.D0
END DO
 
 
DO i=1,n
IF (active(i)) THEN
DO ii=0,100
binhelp=DBLE(ii)/5.D0
IF ((gal_massWeightedAge(i)>(binhelp-0.1)).AND.(gal_massWeightedAge(i)<(binhelp+0.1))) THEN
plot_bin(ii)=plot_bin(ii)+1.D0
END IF
END DO
END IF
END DO

DO i=0,100
plot_bin(i)=plot_bin(i)/DBLE(n)
END DO
 
OPEN(70,file='prepare/age_cc_bc.txt')
DO i=0,100
binhelp=DBLE(i)/5.D0
WRITE(70,*) binhelp,plot_bin(i)
END DO
 CLOSE (70) 

 
DO i=0,500
DO ii=0,500
mapmap(i,ii)=0
END DO
END DO

DO i=1,n
IF (active(i)) THEN
help_x=NINT((-gal_zDust(i)-18.D0)*50.D0)
help_y=NINT(((gal_gDust(i)-gal_rDust(i))+2.D0)*100.D0)
IF ((help_x>0).AND.(help_x<500)) THEN
IF ((help_y>0).AND.(help_y<400)) THEN
mapmap(help_x,help_y)=mapmap(help_x,help_y)+1
END IF
END IF
END IF
END DO

OPEN(61,file='prepare/CMD_map_cc_bc.txt')
DO i=0,500
DO ii=0,400
help_x2=-(DBLE(i)/50.D0)-18.D0
help_y2=(DBLE(ii)/100.D0)-2.D0
WRITE(61,*) help_x2,help_y2,LOG10(mapmap(i,ii)+1)
END DO
END DO
 CLOSE(61)

 
 
 
 DO i=0,100
plot_bin(i)=0.D0
END DO
 
 
DO i=1,n
IF (active(i)) THEN
DO ii=0,100
binhelp=DBLE(ii)/20.D0
IF ((log_gal_mvir(i)>(binhelp-0.025)).AND.(log_gal_mvir(i)<(binhelp+0.025))) THEN
plot_bin(ii)=plot_bin(ii)+1.D0
END IF
END DO
END IF
END DO

DO i=0,100
plot_bin(i)=plot_bin(i)/DBLE(n)
END DO
 
OPEN(70,file='prepare/mvir_cc_bc.txt')
DO i=0,100
binhelp=DBLE(i)/20.D0
WRITE(70,*) binhelp,plot_bin(i)
END DO
 CLOSE (70) 

 
  DO i=0,100
plot_bin(i)=0.D0
END DO
 
  
DO i=1,n
IF (active(i)) THEN
DO ii=0,100
binhelp=DBLE(ii)/20.D0
IF ((gal_log_mass(i)>(binhelp-0.025)).AND.(gal_log_mass(i)<(binhelp+0.025))) THEN
plot_bin(ii)=plot_bin(ii)+1.D0
END IF
END DO
END IF
END DO

DO i=0,100
plot_bin(i)=plot_bin(i)/DBLE(n)
END DO
 
OPEN(70,file='prepare/mass_cc_bc.txt')
DO i=0,100
binhelp=DBLE(i)/20.D0
WRITE(70,*) binhelp,plot_bin(i)
END DO
 CLOSE (70) 

 

 
 

 
DO i=0,100
plot_bin(i)=0.D0
END DO
 
 
DO i=1,n
IF (active(i)) THEN
DO ii=0,100
binhelp=(DBLE(-ii)/20.D0)+3.D0
IF ((log_gal_ratio_disk_gas_star(i)>(binhelp-0.025)).AND.(log_gal_ratio_disk_gas_star(i)<(binhelp+0.025))) THEN
plot_bin(ii)=plot_bin(ii)+1.D0
END IF
END DO
END IF
END DO

DO i=0,100
plot_bin(i)=plot_bin(i)/DBLE(n)
END DO
 
OPEN(70,file='prepare/log_disk_gas_cc_bc.txt')
DO i=0,100
binhelp=(DBLE(-i)/20.D0)+3.D0
WRITE(70,*) binhelp,plot_bin(i)
END DO
 CLOSE (70)
 
 
 
 
 
 
DO i=0,100
plot_bin(i)=0.D0
END DO
 
 
DO i=1,n
IF (active(i)) THEN
DO ii=0,100
binhelp=(DBLE(-ii)/20.D0)+0.1D0
IF ((log_gal_ratio_bulge_star(i)>(binhelp-0.025)).AND.(log_gal_ratio_bulge_star(i)<(binhelp+0.025))) THEN
plot_bin(ii)=plot_bin(ii)+1.D0
END IF
END DO
END IF
END DO

DO i=0,100
plot_bin(i)=plot_bin(i)/DBLE(n)
END DO
 
OPEN(70,file='prepare/log_bulge_star_cc_bc.txt')
DO i=0,100
binhelp=(DBLE(-i)/20.D0)+0.1D0
WRITE(70,*) binhelp,plot_bin(i)
END DO
 CLOSE (70)
 
 
 
 
 
  DO i=0,100
plot_bin(i)=0.D0
END DO
 
 
DO i=1,n
IF (active(i)) THEN
DO ii=0,100
binhelp=(DBLE(-ii)/10.D0)+4.D0
IF ((log_gal_ratio_gas_star(i)>(binhelp-0.05)).AND.(log_gal_ratio_gas_star(i)<(binhelp+0.05))) THEN
plot_bin(ii)=plot_bin(ii)+1.D0
END IF
END DO
END IF
END DO

DO i=0,100
plot_bin(i)=plot_bin(i)/DBLE(n)
END DO
 
OPEN(70,file='prepare/log_gas_star_cc_bc.txt')
DO i=0,100
binhelp=(DBLE(-i)/10.D0)+4.D0
WRITE(70,*) binhelp,plot_bin(i)
END DO
 CLOSE (70)
 
 
 

 DO i=0,100
plot_bin(i)=0.D0
END DO
 
 
DO i=1,n
IF (active(i)) THEN
DO ii=0,100
binhelp=(DBLE(-ii)/10.D0)+6.D0
IF ((log_gal_ratio_bulge_disk(i)>(binhelp-0.05)).AND.(log_gal_ratio_bulge_disk(i)<(binhelp+0.05))) THEN
plot_bin(ii)=plot_bin(ii)+1.D0
END IF
END DO
END IF
END DO

DO i=0,100
plot_bin(i)=plot_bin(i)/DBLE(n)
END DO
 
OPEN(70,file='prepare/log_bulge_disk_cc_bc.txt')
DO i=0,100
binhelp=(DBLE(-i)/10.D0)+6.D0
WRITE(70,*) binhelp,plot_bin(i)
END DO
 CLOSE (70)
 
 
 
   
DO i=1,n
IF (active(i)) THEN
DO ii=0,100
binhelp=(DBLE(-ii)/10.D0)-18.D0
IF ((gal_rdust(i)>(binhelp-0.05)).AND.(gal_rdust(i)<(binhelp+0.05))) THEN
plot_bin(ii)=plot_bin(ii)+1.D0
END IF
END DO
END IF
END DO

DO i=0,100
plot_bin(i)=plot_bin(i)/DBLE(n)
END DO
 
OPEN(70,file='prepare/lumfunction_cc_bc.txt')
DO i=0,100
binhelp=(DBLE(-i)/10.D0)-18.D0
WRITE(70,*) binhelp,plot_bin(i)
END DO
 CLOSE (70)
 
 
 
  DO i=1,n
IF ((log_gal_ratio_sfr(i))>-2.D0) THEN
 active(i)=.FALSE.
END IF
 END DO
 

    h_count=0
 DO i=1,n
 IF (active(i)) THEN
 h_count=h_count+1
 END IF
 END DO 
 

 WRITE(*,*) h_count,'galaxies with low sfr'
 
 
 
 
 
 
DO i=0,100
plot_bin(i)=0.D0
END DO
 
 
DO i=1,n
IF (active(i)) THEN
DO ii=0,100
binhelp=DBLE(-ii)/20.D0
IF ((log_gal_ratio_coldgas(i)>(binhelp-0.025)).AND.(log_gal_ratio_coldgas(i)<(binhelp+0.025))) THEN
plot_bin(ii)=plot_bin(ii)+1.D0
END IF
END DO
END IF
END DO

DO i=0,100
plot_bin(i)=plot_bin(i)/DBLE(n)
END DO
 
OPEN(70,file='prepare/log_coldgas_cc_bc_sfrc.txt')
DO i=0,100
binhelp=DBLE(-i)/20.D0
WRITE(70,*) binhelp,plot_bin(i)
END DO
 CLOSE (70)
 
 
 
 DO i=0,100
plot_bin(i)=0.D0
END DO
 
 
DO i=1,n
IF (active(i)) THEN
DO ii=0,100
binhelp=DBLE(-ii)/10.D0
IF ((log_gal_ratio_sfr(i)>(binhelp-0.05)).AND.(log_gal_ratio_sfr(i)<(binhelp+0.05))) THEN
plot_bin(ii)=plot_bin(ii)+1.D0
END IF
END DO
END IF
END DO

DO i=0,100
plot_bin(i)=plot_bin(i)/DBLE(n)
END DO
 
OPEN(70,file='prepare/log_sfr_cc_bc_sfrc.txt')
DO i=0,100
binhelp=DBLE(-i)/10.D0
WRITE(70,*) binhelp,plot_bin(i)
END DO
 CLOSE (70)
 
 
 DO i=0,100
plot_bin(i)=0.D0
END DO
 
 
DO i=1,n
IF (active(i)) THEN
DO ii=0,100
binhelp=DBLE(ii)/5.D0
IF ((gal_massWeightedAge(i)>(binhelp-0.1)).AND.(gal_massWeightedAge(i)<(binhelp+0.1))) THEN
plot_bin(ii)=plot_bin(ii)+1.D0
END IF
END DO
END IF
END DO

DO i=0,100
plot_bin(i)=plot_bin(i)/DBLE(n)
END DO
 
OPEN(70,file='prepare/age_cc_bc_sfrc.txt')
DO i=0,100
binhelp=DBLE(i)/5.D0
WRITE(70,*) binhelp,plot_bin(i)
END DO
 CLOSE (70) 

 
DO i=0,500
DO ii=0,500
mapmap(i,ii)=0
END DO
END DO

DO i=1,n
IF (active(i)) THEN
help_x=NINT((-gal_zDust(i)-18.D0)*50.D0)
help_y=NINT(((gal_gDust(i)-gal_rDust(i))+2.D0)*100.D0)
IF ((help_x>0).AND.(help_x<500)) THEN
IF ((help_y>0).AND.(help_y<400)) THEN
mapmap(help_x,help_y)=mapmap(help_x,help_y)+1
END IF
END IF
END IF
END DO

OPEN(61,file='prepare/CMD_map_cc_bc_sfrc.txt')
DO i=0,500
DO ii=0,400
help_x2=-(DBLE(i)/50.D0)-18.D0
help_y2=(DBLE(ii)/100.D0)-2.D0
WRITE(61,*) help_x2,help_y2,LOG10(mapmap(i,ii)+1)
END DO
END DO
 CLOSE(61)

 
 
 
 DO i=0,100
plot_bin(i)=0.D0
END DO
 
 
DO i=1,n
IF (active(i)) THEN
DO ii=0,100
binhelp=DBLE(ii)/20.D0
IF ((log_gal_mvir(i)>(binhelp-0.025)).AND.(log_gal_mvir(i)<(binhelp+0.025))) THEN
plot_bin(ii)=plot_bin(ii)+1.D0
END IF
END DO
END IF
END DO

DO i=0,100
plot_bin(i)=plot_bin(i)/DBLE(n)
END DO
 
OPEN(70,file='prepare/mvir_cc_bc_sfrc.txt')
DO i=0,100
binhelp=DBLE(i)/20.D0
WRITE(70,*) binhelp,plot_bin(i)
END DO
 CLOSE (70) 

 
  DO i=0,100
plot_bin(i)=0.D0
END DO
 
  
DO i=1,n
IF (active(i)) THEN
DO ii=0,100
binhelp=DBLE(ii)/20.D0
IF ((gal_log_mass(i)>(binhelp-0.025)).AND.(gal_log_mass(i)<(binhelp+0.025))) THEN
plot_bin(ii)=plot_bin(ii)+1.D0
END IF
END DO
END IF
END DO

DO i=0,100
plot_bin(i)=plot_bin(i)/DBLE(n)
END DO
 
OPEN(70,file='prepare/mass_cc_bc_sfrc.txt')
DO i=0,100
binhelp=DBLE(i)/20.D0
WRITE(70,*) binhelp,plot_bin(i)
END DO
 CLOSE (70) 

 

 
 

 
DO i=0,100
plot_bin(i)=0.D0
END DO
 
 
DO i=1,n
IF (active(i)) THEN
DO ii=0,100
binhelp=(DBLE(-ii)/20.D0)+3.D0
IF ((log_gal_ratio_disk_gas_star(i)>(binhelp-0.025)).AND.(log_gal_ratio_disk_gas_star(i)<(binhelp+0.025))) THEN
plot_bin(ii)=plot_bin(ii)+1.D0
END IF
END DO
END IF
END DO

DO i=0,100
plot_bin(i)=plot_bin(i)/DBLE(n)
END DO
 
OPEN(70,file='prepare/log_disk_gas_cc_bc_sfrc.txt')
DO i=0,100
binhelp=(DBLE(-i)/20.D0)+3.D0
WRITE(70,*) binhelp,plot_bin(i)
END DO
 CLOSE (70)
 
 
 
 
 
 
DO i=0,100
plot_bin(i)=0.D0
END DO
 
 
DO i=1,n
IF (active(i)) THEN
DO ii=0,100
binhelp=(DBLE(-ii)/20.D0)+0.1D0
IF ((log_gal_ratio_bulge_star(i)>(binhelp-0.025)).AND.(log_gal_ratio_bulge_star(i)<(binhelp+0.025))) THEN
plot_bin(ii)=plot_bin(ii)+1.D0
END IF
END DO
END IF
END DO

DO i=0,100
plot_bin(i)=plot_bin(i)/DBLE(n)
END DO
 
OPEN(70,file='prepare/log_bulge_star_cc_bc_sfrc.txt')
DO i=0,100
binhelp=(DBLE(-i)/20.D0)+0.1D0
WRITE(70,*) binhelp,plot_bin(i)
END DO
 CLOSE (70)
 
 
 
 
 
  DO i=0,100
plot_bin(i)=0.D0
END DO
 
 
DO i=1,n
IF (active(i)) THEN
DO ii=0,100
binhelp=(DBLE(-ii)/10.D0)+4.D0
IF ((log_gal_ratio_gas_star(i)>(binhelp-0.05)).AND.(log_gal_ratio_gas_star(i)<(binhelp+0.05))) THEN
plot_bin(ii)=plot_bin(ii)+1.D0
END IF
END DO
END IF
END DO

DO i=0,100
plot_bin(i)=plot_bin(i)/DBLE(n)
END DO
 
OPEN(70,file='prepare/log_gas_star_cc_bc_sfrc.txt')
DO i=0,100
binhelp=(DBLE(-i)/10.D0)+4.D0
WRITE(70,*) binhelp,plot_bin(i)
END DO
 CLOSE (70)
 
 
 

 DO i=0,100
plot_bin(i)=0.D0
END DO
 
 
DO i=1,n
IF (active(i)) THEN
DO ii=0,100
binhelp=(DBLE(-ii)/10.D0)+6.D0
IF ((log_gal_ratio_bulge_disk(i)>(binhelp-0.05)).AND.(log_gal_ratio_bulge_disk(i)<(binhelp+0.05))) THEN
plot_bin(ii)=plot_bin(ii)+1.D0
END IF
END DO
END IF
END DO

DO i=0,100
plot_bin(i)=plot_bin(i)/DBLE(n)
END DO
 
OPEN(70,file='prepare/log_bulge_disk_cc_bc_sfrc.txt')
DO i=0,100
binhelp=(DBLE(-i)/10.D0)+6.D0
WRITE(70,*) binhelp,plot_bin(i)
END DO
 CLOSE (70)
 
 
 
   nnn=0
   
   
DO i=1,n
IF (active(i)) THEN
DO ii=0,100
binhelp=(DBLE(-ii)/10.D0)-18.D0
IF ((gal_rdust(i)>(binhelp-0.05)).AND.(gal_rdust(i)<(binhelp+0.05))) THEN
plot_bin(ii)=plot_bin(ii)+1.D0
nnn=nnn+1
END IF
END DO
END IF
END DO

DO i=0,100
plot_bin(i)=plot_bin(i)/DBLE(nnn)
END DO
 
OPEN(70,file='prepare/lumfunction_cc_bc_sfrc.txt')
DO i=0,100
binhelp=(DBLE(-i)/10.D0)-18.D0
WRITE(70,*) binhelp,plot_bin(i)
END DO
 CLOSE (70)
 
 
 
 
 
 
 
 
 
 
 
 
WRITE(*,*) '============================================================'
WRITE(*,*) '    programme complete'
WRITE(*,*) '============================================================'




END PROGRAM






 