#!/bin/bash
#  PortMenu by Robert Katzki.
#  You need Gentoo Linux ( www.gentoo.org ), 
#  especially Portage ( www.gentoo-portage.com ) to use this.


menu() {
	#Print Menu.
	echo
	echo "      ...::::::::...      "
	echo "...::::::PortMenu::::::..."
	echo "--------------------------"
	echo	
	echo " .1. Sync"
	echo " .2. Update"
	echo " .3. Search"
	echo " .4. Install"
	echo " .5. Etc-Update"
	echo " .6. Uninstall"
	echo " .7. Clean"
	echo " .8. Edit make.conf"
	echo " .9. Edit /etc/portage/package.*"
	echo 
	echo " .x. Exit"
	echo
}
menu
choose() {
	echo
	echo "Please choose and press enter. Choose m to print the menu."

#Read what to do (wtd) ;).
read wtd

case $wtd in
	
	1) emerge --sync
	   choose
	;;
	
	2) emerge -avuD world
	   choose
	;;
	
	3) echo "Search ? "
	   read search
	   emerge -s $search
	   choose
	;;
	
	4) echo "Install ? "
	   read install
	   emerge -av $install
	   choose
	;;

	5) etc-update
	   choose
	;;

	6) echo "uninstall ? "
	   read uninstall
	   emerge -aC $uninstall
	   choose
	;;
	
	7) rm -r /usr/portage/distfiles/*
	   rm -r /var/tmp/portage/*
	   choose
	;;
	
	8) vim /etc/make.conf
	   choose
	;;
	
	9) echo "Edit /etc/portage/package.*"
	   echo "You can choose 'mask', 'unmask', 'keywords' or 'use'."
	   read edit
	   vim /etc/portage/package.$edit
	   choose
	;;

	m) menu
	     choose
	;;
	
	x) echo
	   echo "Bye."
	   echo
	;;
	
	*) menu
	    choose
	;;
esac

}
choose
