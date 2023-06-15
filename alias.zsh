# aliases for Tmux
#alias tmux='tmux -2'
#alias ta='tmux attach -t'
#alias tnew='tmux new -s'
#alias tls='tmux ls'
#alias tkill='tmux kill-session -t'
alias mux="tmuxinator"
alias nv="nvim"
alias evp="pushd ~/.config/nvim/lua && vi ~/.config/nvim/lua/custom/plugins.lua; popd"
alias evm="pushd ~/.config/nvim/lua && vi ~/.config/nvim/lua/custom/mappings.lua; popd"
alias t="mux default"
alias em="mux edit default"
alias pb="ansible-playbook -i /home/eamon/src/bronding/infra/ansible/inventory/signet/inventory.yaml"

# # convenience aliases for editing configs
alias ev='vi ~/.vimrc'
alias et='vi ~/.tmux.conf'
alias ez='vi ~/.zshrc'
alias rz='source ~/.zshrc'
alias ea='vi ~/.alias.zsh'

if [[ `hostname -f | sed -e 's/^[^.]*\.//'` == "cluster" ]] ; then
    alias ls='ls -h --color'
fi

# custom
#alias ls='ls -h'
alias lh='ls -lth|/usr/bin/head -20'
alias lds='ls -ld */'
alias ll='ls -lh'
alias lsd='ls -lhd */'
alias wlh='watch "ls -lth |head -20"'
alias W='pushd /W/em250772'
alias s='less STDOUT'
#alias s='rm .watchfile ; while sleep 2; do tail -20 STDOUT > .watchtmp; clear; cat .watchtmp; watchdir 1800; done'
alias ss='watch tail -20 STDOUT'
alias so='rm .watchfile ;  while sleep 2; do zsh -c "grep :FR ${PWD##*/}.scf | tail -5 ; echo -- && tail -20 STDOUT  ; watchdir 180" > .watchtmp; clear; cat .watchtmp; done'
alias q='qstat -u em250772 -n'
alias qs='qsub job'
alias qj='qsub job'
alias wq='watch "qstat -u em250772 "'
alias xqt='x qtl -p  -telnes'
alias xqtso='x qtl -p  -telnes -so'
alias vi='nvim'
alias dh='dirs -v'
alias vj='vim +14 job'
alias ej='vim +14 job'
alias ra='source ~/.alias.zsh'
alias psm='ps -fjH -u em250772'
alias lm='cp ~/templates/local_machines .machines'

#python
alias j='jupyter notebook --no-browser'
alias webgui='lpad webgui -s --host summer.intra.cea.fr'

#fireworks
alias tq='rlaunch rapidfire --nlaunches infinite --sleep 5'
alias pq='rlaunch -l ~/.fireworks/prodlocal_launchpad.yaml rapidfire --nlaunches infinite --sleep 5'
alias ma='mongo -u admin -p svCpKjWsmhL1\!74D'

function mkjob () {
	cp ~/templates/job .
	chmod a+x ./job
	fullpath=${PWD##}
	case=${PWD##*/}
	sed -i "s#NUMNODES_HERE#$1#g" ./job
	sed -i "s#PATH_HERE#$fullpath#g" ./job
	sed -i "s#CASE_HERE#$case#g" ./job
    sed -i "s#SP_HERE#$2#g" ./job
}

function mkjobqtl () {
	cp ~/templates/jobqtl .
	chmod a+x ./job
	fullpath=${PWD##}
	case=${PWD##*/}
	sed -i "s#PATH_HERE#$fullpath#g" ./jobqtl
	sed -i "s#CASE_HERE#$case#g" ./jobqtl
}

function mkojob () {
	cp ~/templates/ojob .
	chmod a+x ./ojob
	fullpath=${PWD##}
	case=${PWD##*/}
	sed -i "s#NUMNODES_HERE#$1#g" ./ojob
	sed -i "s#PATH_HERE#$fullpath#g" ./ojob
	sed -i "s#CASE_HERE#$case#g" ./ojob
	sed -i "s#OPTNAME_HERE#$2#g" ./ojob
}

function mkjobfdmnes () {
	cp ~/templates/jobfdmnes ./job
	chmod a+x ./job
	fullpath=${PWD##}
	case=${PWD##*/}
	sed -i "s#NUMNODES_HERE#$1#g" ./job
	sed -i "s#PATH_HERE#$fullpath#g" ./job
	sed -i "s#CASE_HERE#$case#g" ./job
}

function mkfdmnes () {
    fullpath=${PWD##}
    case=${PWD##*/}
    mkdir fdmnes
    cd fdmnes
    cp ../$case.struct .
    cp ../$case.corewfx .
    cp ../$case.vcoul .
    cp ../$case.r2v .
    cp ../$case.clmsum .
    cp ~/templates/fdmfile.txt .
    cp ~/templates/fdmnes.in ./$case.in
    sed -i "s#CASE_HERE#$case#g" ./$case.in
    sed -i "s#CASE_HERE#$case#g" ./fdmfile.txt
    cat $case.corewfx |wc -l > $case.1s
    cat $case.corewfx >> $case.1s
    sed -i "s/..............$//g" $case.1s
    mkjobfdmnes 1
}

function packdos () {
    tar cf "$1$2".tar --ignore-failed-read --transform='s,.*\.,,' "$1"/*DOS_* "$1"/*XAS_* "$1"/*XES_*
}

