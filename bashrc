#!/bin/bash	-Version du 16/10/2003
#
#	Appel du bashrc commun
#
#source /home/gene/gene.bashrc

#Mettre ci-dessous les alias qui vous sont propres
#export PATH=/home/em250772/bin:$PATH

export PS1='\u@\h:\w>'
alias lh='ls -lth|head -20'
alias wlh='watch "ls -lth |head -20"'
alias W='pushd /W/em250772'
alias s='less STDOUT'
alias q='qstat -u em250772'
alias wq='watch "qstat -u em250772"'
alias ls='ls -h'
#alias xqt='x qtl -p  -telnes'
#alias xqtso='x qtl -p  -telnes -so'
alias j='jupyter notebook --no-browser'


xqt () {
	x qtl -p -telnes && x telnes3 && x broadening
}

xtso () {
	x qtl -p -telnes -so && x telnes3 && x broadening
}

export -f xqt
export -f xtso

#source /opt/softs/mkl/16/bin/compilervars.sh intel64
#source /opt/softs/icc/15/bin/compilervars.sh intel64

if [ -z "$BASHRC_READ" ] && [ $HOSTNAME == "summer" ]; then
   export BASHRC_READ=1
   source  /etc/profile.d/modules.sh
fi
   # Place any module commands here
   # module load git
#   module load icc/15
#   module -q load mkl/16
#   module load impi
#   module load ompi
#   module load python/2.7.8
if [ $HOSTNAME == "summer" ]; then
    module -q restore
fi

   export LD_LIBRARY_PATH=/home/em250772/lib:$LD_LIBRARY_PATH
#   export LD_LIBRARY_PATH=/home/prog/usr/fftw3/lib:$LD_LIBRARY_PATH
#   export LD_LIBRARY_PATH=/opt/softs/mpi/openmpi-1.6.5_intel-13.0/lib:$LD_LIBRARY_PATH

# --- BERRYPI START ---
export BERRYPI_PATH=$WIENROOT/SRC_BerryPI/BerryPI
export BERRYPI_PYTHON=`which python`
alias berrypi="${BERRYPI_PYTHON} ${BERRYPI_PATH}/berrypi"
# --- BERRYPI END ---
# --- BERRYPI START ---
export BERRYPI_PATH=$WIENROOT/SRC_BerryPI/BerryPI
export BERRYPI_PYTHON=/opt/softs/python/2.7.8/bin/python
alias berrypi="${BERRYPI_PYTHON} ${BERRYPI_PATH}/berrypi"
# --- BERRYPI END ---
# added by WIEN2k: BEGIN
# --------------------------------------------------------
alias lsi="ls -aslp *.in*"
alias lso="ls -aslp *.output*"
alias lsd="ls -aslp *.def"
alias lsc="ls -aslp *.clm*"
alias lss="ls -aslp *.scf* */*.scf"
alias lse="ls -aslp *.error"
alias LS="ls -aslp | grep /"
alias pslapw="ps -ef |grep "lapw""
alias cdw="cd /W/em250772"
export OMP_NUM_THREADS=1
#export LD_LIBRARY_PATH=.....
export EDITOR="/home/em250772/vi"
export SCRATCH=./
export WIENROOT=/home/em250772/WIEN2k_18
export W2WEB_CASE_BASEDIR=/W/em250772
export STRUCTEDIT_PATH=$WIENROOT/SRC_structeditor/bin
export PDFREADER=acroread
export PATH=$WIENROOT:$STRUCTEDIT_PATH:$WIENROOT/SRC_IRelast/script-elastic:$PATH:.
export OCTAVE_EXEC_PATH=${PATH}::
export OCTAVE_PATH=${STRUCTEDIT_PATH}::

#export PATH=$PATH:$WIENROOT:.
ulimit -s unlimited 2> /dev/null
alias octave="octave -p $OCTAVE_PATH"
# --------------------------------------------------------
# added by WIEN2k: END
# --- BERRYPI START ---
export BERRYPI_PATH=$WIENROOT/SRC_BerryPI/BerryPI
export BERRYPI_PYTHON=/opt/softs/python/2.7.8/bin/python
alias berrypi="${BERRYPI_PYTHON} ${BERRYPI_PATH}/berrypi"
# --- BERRYPI END ---

