safe_rm=~/.rm_saved/

function rm 
{
	local opt_force=0
	local opt_interactive=0
	local opt_recursive=0
	local opt_verbose=0
	local opt_empty=0
	local opt_list=0
	local opt_restore=0
	local opt

	OPTERR=0
  	# Analyse command line arguments
	while getopts ":dfirRvels-:" opt; do
		case $opt in
      	d ) ;; #ignored
      	f ) opt_force=1 ;;
      	i ) opt_interactive=1 ;;
      	r|R)opt_recursive=1 ;;
      	v ) opt_verbose=1 ;;
      	e ) opt_empty=1 ;;
      	l ) opt_list=1 ;;
      	s ) opt_restore=1 ;;
      	- ) case $OPTARG in
				directory ) ;;
				force ) opt_force=1 ;;
				interactive ) opt_interactive=1 ;;
   			recursive ) opt_recursive=1 ;;
				verbose ) opt_verbose=1 ;;

				help )  /bin/rm --help
					echo "rm_secure:"
					echo " -e --empty 	empty the trash bin"
					echo " -l --list 	display saved files"
					echo " -s --restore 	restore files"
					return 0 ;;

				version ) /bin/rm --version 
					echo "(rm_secure 1.2)"
					return 0 ;;

				empty ) opt_empty=1 ;;
				list )  opt_list=1 ;;
				restore ) opt_restore=1 ;;
				* ) echo "illegal option --$OPTARG"
	 	    		return 1 ;;
          	esac ;;
      	? ) echo "illegal option --$OPTARG"
	  			return 1 ;;
		esac 
  	done
  	
shift $(($OPTIND - 1))

#creat the save directory eventually
if [ ! -d "$safe_rm" ] ; then 
	mkdir "$safe_rm"
fi

#empty the trash
if [ $opt_empty -ne 0 ] ; then
	/bin/rm -rf "$safe_rm"
	return 0
fi

#list saved files
if [ $opt_list -ne 0 ] ; then
		( cd "$safe_rm"
		  ls -lRa * )
fi

#restore files
if [ $opt_restore -ne 0 ] ; then


fi








  	
		





      
