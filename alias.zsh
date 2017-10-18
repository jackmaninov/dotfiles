# aliases for Tmux
#alias tmux='tmux -2'
#alias ta='tmux attach -t'
#alias tnew='tmux new -s'
#alias tls='tmux ls'
#alias tkill='tmux kill-session -t'
alias mux="tmuxinator"
alias t="m default"
alias em="mux edit default"

# # convenience aliases for editing configs
alias ev='vim ~/.vimrc'
alias et='vim ~/.tmux.conf'
alias ez='vim ~/.zshrc'
alias rz='source ~/.zshrc'
alias ea='vi ~/.alias.zsh'

# custom
alias ls='ls --color -h'
alias lh='ls -lth|/usr/bin/head -20'
alias ll='ls -lh'
alias wlh='watch "ls -lth |head -20"'
alias W='pushd /W/em250772'
alias s='less STDOUT'
#alias s='rm .watchfile ; while sleep 2; do tail -20 STDOUT > .watchtmp; clear; cat .watchtmp; watchdir 1800; done'
alias ss='watch tail -20 STDOUT'
alias so='rm .watchfile ;  while sleep 2; do zsh -c "grep :FR ${PWD##*/}.scf | tail -5 ; echo -- && tail -20 STDOUT  ; watchdir 180" > .watchtmp; clear; cat .watchtmp; done'
alias q='qstat -u em250772'
alias qs='qsub job'
alias qj='qsub job'
alias wq='watch "qstat -u em250772"'
alias xqt='x qtl -p  -telnes'
alias xqtso='x qtl -p  -telnes -so'
alias j='jupyter notebook --no-browser'
alias vi='vim'
alias dh='dirs -v'
alias vj='vim +14 job'
alias ej='vim +14 job'
alias ra='source ~/.alias.zsh'
alias psm='ps -fjH -u em250772'

#tmux

function mkjob () {
	cp /W/em250772/job .
	chmod a+x ./job
	fullpath=${PWD##}
	case=${PWD##*/}
	sed -i "s#NUMNODES_HERE#$1#g" ./job
	sed -i "s#PATH_HERE#$fullpath#g" ./job
	sed -i "s#CASE_HERE#$case#g" ./job
}

function mkjobqtl () {
	cp /W/em250772/jobqtl .
	chmod a+x ./job
	fullpath=${PWD##}
	case=${PWD##*/}
	sed -i "s#PATH_HERE#$fullpath#g" ./jobqtl
	sed -i "s#CASE_HERE#$case#g" ./jobqtl
}

function mkojob () {
	cp /W/em250772/ojob .
	chmod a+x ./ojob
	fullpath=${PWD##}
	case=${PWD##*/}
	sed -i "s#NUMNODES_HERE#$1#g" ./ojob
	sed -i "s#PATH_HERE#$fullpath#g" ./ojob
	sed -i "s#CASE_HERE#$case#g" ./ojob
	sed -i "s#OPTNAME_HERE#$2#g" ./ojob
}
