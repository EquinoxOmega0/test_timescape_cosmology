PROGRAM pt_programme
! declaration of variables
IMPLICIT NONE
double precision :: PI,H0,q0,light,G,rho_crit,ts_modificator
integer(kind=8) :: io_err,i,ii,iii,n_fg,n_fp
integer :: r_seed,uuu
double precision :: cV_mill,m_expected,Omega_m,Omega_l,h,part_exp,divisor,dummy_var

double precision, allocatable ::red(:),mass(:),px(:),py(:),pz(:),rad(:)
integer(kind=8), allocatable :: cluster_id(:),n_fp_in_cluster(:),members_clustercore(:)
double precision, allocatable :: ra_clustercore(:),dec_clustercore(:),z_clustercore(:)
double precision, allocatable :: cluster_fp_adist_m(:),cluster_fp_cdist_m(:),cluster_fp_ldist_m(:)
double precision, allocatable :: cluster_z_adist_m(:),cluster_z_cdist_m(:),cluster_z_ldist_m(:)
double precision, allocatable :: cx(:),cy(:),cz(:),H_relative(:),weights(:)
character(20) :: mockstr

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

ts_modificator=(50.1D0/61.7D0)**2
part_exp=(2160.D0**3)*((330.D0/500.D0)**3)
! rho_crit=3.D0*((H0)**2)/(8.D0*PI*(G*((1.D-6)**3)))
 cV_mill=(400.D6/h)**3
m_expected=cV_mill*rho_crit*Omega_m


DO uuu=1,8

IF (uuu==1) THEN
mockstr='mock1'
END IF
IF (uuu==2) THEN
mockstr='mock2'
END IF
IF (uuu==3) THEN
mockstr='mock3'
END IF
IF (uuu==4) THEN
mockstr='mock4'
END IF
IF (uuu==5) THEN
mockstr='mock5'
END IF
IF (uuu==6) THEN
mockstr='mock6'
END IF
IF (uuu==7) THEN
mockstr='mock7'
END IF
IF (uuu==8) THEN
mockstr='mock8'
END IF
 
  mockstr=TRIM(adjustl(mockstr))
  

! get length of file
OPEN(50,file='prepare/mock_catalogues/catalogues/fi_regions_fullmass_'//TRIM(mockstr)//'.txt')
io_err=0
n_fg=0
DO WHILE (io_err==0) 
READ(50,*,iostat=io_err) 
n_fg=n_fg+1
END DO
 CLOSE(50)
n_fg=n_fg-1


! get length of file
OPEN(50,file='prepare/mock_catalogues/catalogues/cluster_fp_distances_SDSS_'//TRIM(mockstr)//'.txt')
io_err=0
n_fp=0
DO WHILE (io_err==0) 
READ(50,*,iostat=io_err) 
n_fp=n_fp+1
END DO
 CLOSE(50)
n_fp=n_fp-1


allocate(px(1:n_fg))
allocate(py(1:n_fg))
allocate(pz(1:n_fg))
allocate(rad(1:n_fg))
allocate(mass(1:n_fg))

allocate(cluster_id(1:n_fp))
allocate(n_fp_in_cluster(1:n_fp))
allocate(members_clustercore(1:n_fp))
allocate(ra_clustercore(1:n_fp))
allocate(dec_clustercore(1:n_fp))
allocate(z_clustercore(1:n_fp))
allocate(cluster_fp_adist_m(1:n_fp))
allocate(cluster_fp_cdist_m(1:n_fp))
allocate(cluster_fp_ldist_m(1:n_fp))
allocate(cluster_z_adist_m(1:n_fp))
allocate(cluster_z_cdist_m(1:n_fp))
allocate(cluster_z_ldist_m(1:n_fp))

allocate(cx(1:n_fp))
allocate(cy(1:n_fp))
allocate(cz(1:n_fp))
allocate(H_relative(1:n_fp))
allocate(weights(1:n_fp))


OPEN(50,file='prepare/mock_catalogues/catalogues/fi_regions_fullmass_'//TRIM(mockstr)//'.txt')
 DO i=1,n_fg
READ(50,*) px(i),py(i),pz(i),mass(i),dummy_var,rad(i),dummy_var
END DO
 CLOSE(50)

 
 
 
 OPEN(50,file='prepare/mock_catalogues/catalogues/cluster_fp_distances_SDSS_'//TRIM(mockstr)//'.txt')
 DO i=1,n_fp
 READ(50,*) cluster_id(i),ra_clustercore(i),dec_clustercore(i),z_clustercore(i),dummy_var,&
 cluster_fp_adist_m(i),dummy_var,cluster_fp_cdist_m(i),dummy_var,cluster_fp_ldist_m(i),dummy_var,&
 cluster_z_adist_m(i),dummy_var,cluster_z_cdist_m(i),dummy_var,cluster_z_ldist_m(i),dummy_var,&
 n_fp_in_cluster(i),members_clustercore(i)
 END DO
 CLOSE(50)
 
 
 
 
 DO i=1,n_fg
mass(i)=10.D0**mass(i)

rad(i)=((3.D0/(4.D0*PI)*mass(i)/(rho_crit*ts_modificator))**(1.D0/3.D0))/1.D6
END DO


 
 
  DO i=1,n_fp
 dec_clustercore(i)=dec_clustercore(i)*PI/180.D0
 ra_clustercore(i)=ra_clustercore(i)*PI/180.D0

 cx(i)=cluster_fp_cdist_m(i)*COS(dec_clustercore(i))*COS(ra_clustercore(i))
 cy(i)=cluster_fp_cdist_m(i)*COS(dec_clustercore(i))*SIN(ra_clustercore(i))
 cz(i)=cluster_fp_cdist_m(i)*SIN(dec_clustercore(i))
 
H_relative(i)=((light*z_clustercore(i))/cluster_fp_cdist_m(i))/H0
 weights(i)=DBLE(n_fp_in_cluster(i))
 END DO
 
 
 

OPEN(50,file='input/fg_model_'//TRIM(mockstr)//'.txt')
 DO i=1,n_fg
WRITE(50,*) px(i),py(i),pz(i),rad(i)
END DO
 CLOSE(50)

 
 OPEN(50,file='input/ts_data_'//TRIM(mockstr)//'.txt')
 DO i=1,n_fp
IF (z_clustercore(i)<0.1D0) THEN
WRITE(50,*)  cx(i),cy(i),cz(i),H_relative(i),weights(i)
END IF
END DO
 CLOSE(50)
 
 
deallocate(px)
deallocate(py)
deallocate(pz)
deallocate(rad)
deallocate(mass)

deallocate(cluster_id)
deallocate(n_fp_in_cluster)
deallocate(members_clustercore)
deallocate(ra_clustercore)
deallocate(dec_clustercore)
deallocate(z_clustercore)
deallocate(cluster_fp_adist_m)
deallocate(cluster_fp_cdist_m)
deallocate(cluster_fp_ldist_m)
deallocate(cluster_z_adist_m)
deallocate(cluster_z_cdist_m)
deallocate(cluster_z_ldist_m)

deallocate(cx)
deallocate(cy)
deallocate(cz)
deallocate(H_relative)
deallocate(weights)

 
 END DO
 
 
 
 
 
 
 
 
 
WRITE(*,*) '============================================================'
WRITE(*,*) '    programme complete'
WRITE(*,*) '============================================================'




END PROGRAM






 
