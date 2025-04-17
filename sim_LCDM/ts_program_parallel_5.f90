PROGRAM timescape_test

IMPLICIT NONE
! parallization libary
include 'mpif.h'
! declaration of variables
double precision :: PI,goldenratio
integer :: io_err,n,i,ii,iii,n_fg,npara
double precision :: a,b,c,hhh
double precision, allocatable :: H(:),help_fi_intern(:),distance(:),weights(:)
double precision, allocatable :: gx(:),gy(:),gz(:)
double precision, allocatable :: px(:),py(:),pz(:),radius(:),dist2(:),dist(:),radius2(:)
double precision, allocatable :: i_min(:),i_max(:),inside_fi(:),inside_fi_intern(:),positions(:),positions_intern(:)
double precision, allocatable :: ix(:),iy(:),iz(:)
double precision :: frac_dist,int_dist2
integer :: n_infi,n_int
double precision, dimension(0:200,0:200) :: result_map
double precision :: help_x2,help_y2
integer :: help_x,help_y
logical, allocatable :: i_on(:),ip_in(:)
logical :: hsort,loop_on,firstone
double precision :: hsort1,hsort2
character(20) :: mockstr
!parallization variables		
integer ierr, rankrank, nbnodes, namelen
 character (len=MPI_MAX_PROCESSOR_NAME) :: name
!parallization procedures
call MPI_INIT(ierr)
call MPI_COMM_RANK(MPI_COMM_WORLD, rankrank, ierr)
call MPI_COMM_SIZE(MPI_COMM_WORLD, nbnodes, ierr)
call MPI_GET_PROCESSOR_NAME(name, namelen, ierr)	

! define constants
PI=ACOS(-1.D0)
!Defination of golden ratio
goldenratio=(1.D0+SQRT(5.D0))/2.D0

mockstr='mock5'
mockstr=TRIM(adjustl(mockstr))


! define constants
PI=ACOS(-1.D0)
!Defination of golden ratio
goldenratio=(1.D0+SQRT(5.D0))/2.D0

! get length of files
OPEN (50,file='input/ts_data_'//TRIM(mockstr)//'.txt')
io_err=0
n=0
DO WHILE (io_err==0) 
READ(50,*,iostat=io_err) 
n=n+1
END DO
 CLOSE(50)
n=n-1


OPEN (51,file='input/fg_model_'//TRIM(mockstr)//'.txt')
io_err=0
n_fg=0
DO WHILE (io_err==0) 
READ(51,*,iostat=io_err) 
n_fg=n_fg+1
END DO
 CLOSE(51)
n_fg=n_fg-1




! allocate arrays
allocate(H(1:n))
allocate(weights(1:n))
allocate(gx(1:n))
allocate(gy(1:n))
allocate(gz(1:n))
allocate(px(1:n_fg))
allocate(py(1:n_fg))
allocate(pz(1:n_fg))
allocate(radius(1:n_fg))
allocate(radius2(1:n_fg))
allocate(i_min(1:n_fg))
allocate(i_max(1:n_fg))
allocate(i_on(1:n_fg))
allocate(dist2(1:n))
allocate(dist(1:n))
allocate(inside_fi(1:n))
allocate(distance(1:n))

n_int=1000
allocate(ix(1:n_int))
allocate(iy(1:n_int))
allocate(iz(1:n_int))
allocate(ip_in(1:n_int))
! frac_dist n_infi


! read files
OPEN(50,file='input/ts_data_'//TRIM(mockstr)//'.txt')
DO i=1,n 
READ(50,*) gx(i),gy(i),gz(i),H(i),weights(i)
END DO
 CLOSE(50)

OPEN(51,file='input/fg_model_'//TRIM(mockstr)//'.txt')
DO i=1,n_fg 
READ(51,*) px(i),py(i),pz(i),radius(i)
radius2(i)=radius(i)**2
END DO
 CLOSE(51)






! calculate fraction of line of sight in wall environment
DO i=1,n
inside_fi(i)=0.D0
END DO

npara=INT(DBLE(n)/DBLE(nbnodes))+1

ALLOCATE(inside_fi_intern(1:npara))
ALLOCATE(help_fi_intern(1:(npara*nbnodes)))
ALLOCATE(positions(1:(3*npara*nbnodes)))
ALLOCATE(positions_intern(1:(3*npara)))


DO i=1,(3*npara*nbnodes)
positions(i)=0.D0
END DO

DO i=1,n
positions((i-1)*3+1)=gx(i)
positions((i-1)*3+2)=gy(i)
positions((i-1)*3+3)=gz(i)
END DO

firstone=.FALSE.

call MPI_Scatter(positions,(3*npara),MPI_DOUBLE_PRECISION,positions_intern,(3*npara),MPI_DOUBLE_PRECISION,0,MPI_COMM_WORLD,ierr)

IF (positions_intern(1)==gx(1)) THEN
firstone=.TRUE.
END IF
! calculate distance²

!OPEN(61,file='intervall_all.txt')
!OPEN(62,file='intervall_final.txt')

DO i=1,npara
! dist2(i)=(positions_intern((i-1)*3+1)**2)+(positions_intern((i-1)*3+2)**2)+(positions_intern((i-1)*3+3)**2)
! dist(i)=SQRT(dist2(i))

IF (firstone) THEN
WRITE(*,*) i,npara,TRIM(mockstr)
END IF
! calculate intervals	

DO iii=1,n_int
frac_dist=DBLE(iii)/DBLE(n_int)
ix(iii)=frac_dist*positions_intern((i-1)*3+1)
iy(iii)=frac_dist*positions_intern((i-1)*3+2)
iz(iii)=frac_dist*positions_intern((i-1)*3+3)
ip_in(iii)=.FALSE.
END DO



! WRITE(*,*) i,npara

DO iii=1,n_int

loop_on=.TRUE.

ii=0
DO WHILE (loop_on)

ii=ii+1

int_dist2=((px(ii)-ix(iii))**2)+((py(ii)-iy(iii))**2)+((pz(ii)-iz(iii))**2)

IF (int_dist2<radius2(ii)) THEN
ip_in(iii)=.TRUE.
loop_on=.FALSE.
END IF

IF (ii==n_fg) THEN
loop_on=.FALSE.
END IF

  
END DO

END DO

 
! sum up the intervals to get the fraction which is inside fi
inside_fi_intern(i)=0.D0
n_infi=0
DO iii=1,n_int
IF (ip_in(iii)) THEN
n_infi=n_infi+1
END IF
END DO


inside_fi_intern(i)=DBLE(n_infi)/DBLE(n_int)
!DO ii=1,n_fg
!IF (i_on(ii)) THEN
!WRITE(62,*) i_min(ii),i_max(ii),positions_intern((i-1)*3+1),positions_intern((i-1)*3+2),positions_intern((i-1)*3+3)
!END IF
!END DO


END DO


call MPI_AllGather(inside_fi_intern,(npara),MPI_DOUBLE_PRECISION,help_fi_intern,(npara),MPI_DOUBLE_PRECISION,MPI_COMM_WORLD,ierr)


 !CLOSE(61)
 !CLOSE(62)

DO i=1,n
inside_fi(i)=help_fi_intern(i)
END DO

!write output
OPEN(50,file='output/results_'//TRIM(mockstr)//'.txt')
DO i=1,n 
WRITE(50,*) inside_fi(i),H(i)
END DO
 CLOSE(50)

 
DO i=0,200
DO ii=0,200
result_map(i,ii)=0
END DO
END DO


DO i=1,n
help_x=NINT(inside_fi(i)*200.D0)
help_y=NINT(H(i)*100.D0)
IF ((help_x>0).AND.(help_x<200)) THEN
IF ((help_y>0).AND.(help_y<200)) THEN
result_map(help_x,help_y)=result_map(help_x,help_y)+1
END IF
END IF

END DO

OPEN(50,file='output/result_map_'//TRIM(mockstr)//'.txt')
DO i=0,200
DO ii=0,200
help_x2=(DBLE(i)/200.D0)
help_y2=(DBLE(ii)/100.D0)
WRITE(50,*) help_x2,help_y2,result_map(i,ii)
END DO
END DO
 CLOSE(50)
 
 DO i=0,200
DO ii=0,200
result_map(i,ii)=0
END DO
END DO


DO i=1,n
help_x=NINT(inside_fi(i)*200.D0)
help_y=NINT(H(i)*100.D0)
IF ((help_x>0).AND.(help_x<200)) THEN
IF ((help_y>0).AND.(help_y<200)) THEN
result_map(help_x,help_y)=result_map(help_x,help_y)+weights(i)
END IF
END IF

END DO

OPEN(50,file='output/result_map_wighted_'//TRIM(mockstr)//'.txt')
DO i=0,200
DO ii=0,200
help_x2=(DBLE(i)/200.D0)
help_y2=(DBLE(ii)/100.D0)
WRITE(50,*) help_x2,help_y2,result_map(i,ii)
END DO
END DO
 CLOSE(50)
 
 
! Write output in distance bins
DO i=1,n
distance(i)=(gx(i)**2)+(gy(i)**2)+(gz(i)**2)
distance(i)=SQRT(distance(i))
END DO

OPEN(50,file='output/full_results_'//TRIM(mockstr)//'.txt')
DO i=1,n 
WRITE(50,*) inside_fi(i),H(i),distance(i),weights(i)
END DO
 CLOSE(50)

! OPEN(50,file='results_1.txt')
! DO i=1,n 
! IF (distance(i)<100.D0) THEN
! WRITE(50,*) inside_fi(i),H(i)
! END IF
! END DO
!  CLOSE(50)
! 
! OPEN(50,file='results_2.txt')
! DO i=1,n 
! IF ((distance(i)<200.D0).AND.(distance(i)>=100.D0)) THEN
! WRITE(50,*) inside_fi(i),H(i)
! END IF
! END DO
!  CLOSE(50)
! 
! OPEN(50,file='results_3.txt')
! DO i=1,n 
! IF ((distance(i)<300.D0).AND.(distance(i)>=200.D0)) THEN
! WRITE(50,*) inside_fi(i),H(i)
! END IF
! END DO
!  CLOSE(50)
! 
! OPEN(50,file='results_4.txt')
! DO i=1,n 
! IF ((distance(i)<400.D0).AND.(distance(i)>=300.D0)) THEN
! WRITE(50,*) inside_fi(i),H(i)
! END IF
! END DO
!  CLOSE(50)
! 
! OPEN(50,file='results_5.txt')
! DO i=1,n 
! IF (distance(i)>=400.D0) THEN
! WRITE(50,*) inside_fi(i),H(i)
! END IF
! END DO
!  CLOSE(50)



!finalize parallization
call MPI_FINALIZE(ierr)



END PROGRAM 
