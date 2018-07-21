# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$PATH


#summer build settings
if [[ `hostname -f | sed -e 's/^[^.]*\.//'` == "cluster" ]] ; then
    source  /etc/profile.d/modules.sh
    module -q restore

    source /home/em250772/etc/profile.d/grc.bashrc

#    export CC=icc
#    export mpicc=mpiicc
#    export F77=ifort
#    export MPIF77=mpiifort
    export CFLAGS="-O3"
    export FCFLAGS="-O3"
    export FFLAGS="-O3"
    alias ls='ls --color'
fi

export PATH=/home/eamon/anaconda3/bin:$PATH

source $HOME/dotfiles/antigen/antigen.zsh

antigen use oh-my-zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle git
antigen bundle python
antigen bundle command-not-found

antigen theme robbyrussel
antigen bundle nojhan/liquidprompt

antigen apply
# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"
setopt +o nomatch

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias lh='ls -lth|head -20'
alias wlh='watch "ls -lth |head -20"'
alias W='pushd /W/em250772'
alias s='less STDOUT'
alias q='qstat -u em250772'
alias wq='watch "qstat -u em250772"'
alias ls='ls -h'
alias xqt='x qtl -p  -telnes'
alias xqtso='x qtl -p  -telnes -so'
alias j='jupyter notebook --no-browser'
alias vi='vim'

#export LD_LIBRARY_PATH=/home/em250772/lib:$LD_LIBRARY_PATH
#export CPATH=/home/em250772/include:$CPATH

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
export EDITOR="vim"
export SCRATCH=./
export WIENROOT=$HOME/WIEN2k_18
export W2WEB_CASE_BASEDIR=/home/eamon
#export W2WEB_CASE_BASEDIR=/W/em250772
export STRUCTEDIT_PATH=$WIENROOT/SRC_structeditor/bin
export PDFREADER=acroread
export PATH=$WIENROOT:$STRUCTEDIT_PATH:$WIENROOT/SRC_IRelast/script-elastic:$PATH

export OCTAVE_EXEC_PATH=${PATH}::
export OCTAVE_PATH=${STRUCTEDIT_PATH}::
export XCRYSDEN_TOPDIR=$HOME/xcrysden-1.5.60
export XCRYSDEN_SCRATCH=/tmp

export PATH=$PATH:$WIENROOT:.
ulimit -s unlimited
alias octave="octave -p $OCTAVE_PATH"
# --------------------------------------------------------
# added by WIEN2k: END
# --- BERRYPI START ---
export BERRYPI_PATH=$WIENROOT/SRC_BerryPI/BerryPI
export BERRYPI_PYTHON=/opt/softs/python/2.7.8/bin/python
alias berrypi="${BERRYPI_PYTHON} ${BERRYPI_PATH}/berrypi"
# --- BERRYPI END ---
#
#
export FDMNESROOT="$HOME/fdmnes"
export PATH=$PATH:$FDMNESROOT

source ~/.alias.zsh
source $HOME/dotfiles/tmuxinator/completion/tmuxinator.zsh

export FW_CONFIG_FILE=$HOME/.fireworks/FW_config.yaml

#export PATH=/home/prog/gcc/gcc-7.3.0/bin/:$PATH
uuuuuuuusource /home/prog/anaconda/anaconda-3-4.3.1/bin/activate eelsmodel
