#################################################################################################################################################################
# Bang.tcl 2.0
################################################################################################################################################################
#ComputerTech
#IRC Irc.mindforge.org #ComputerTech123
#EMAIL COMPUTERTECH312@GMAIL.COM
#GitHub  https://github.com/computertech312
#Forum http://tcldrop.forumotion.com
#Website http://tcl3.webnode.co.uk
#################################################################################################################################################################
#COMMANDS#
# Shoot   Reload
#################################################################################################################################################################
#START OF SETTINGS#
#Set trigger

set guncmd "!"

#END OF SETTINGS#
#################################################################################################################################################################

namespace eval ::Gun {

global guncmd
     
    variable gun
     
    bind pub - "${guncmd}shoot" ::Gun::do_shoot_nick
    bind pub - "${guncmd}reload" ::Gun::do_reload_nick
     
    proc do_shoot_nick {nick uhost handle chan text} {
    	variable gun
    	set kill [lindex [split $text] 0]
    	set loaded [array names gun -exact $nick]
    	if {$loaded == ""} {
    		putserv "privmsg $chan :\002 DARN IT $nick YOU NEED TO RELOAD YOUR GUN \002"
    		return
    	}
    	putserv "privmsg $chan :\002BANG!! $nick YOU  SHOT  $kill\002" 
    	array unset gun $nick
    }
     
    proc do_reload_nick {nick uhost handle chan text} {
    	variable gun
    	set loaded [array names gun -exact $nick]
    	if {$loaded != ""} {
    		putserv "privmsg $chan :$nick YOUR GUN IS ALREADY RELOAD !"
    		return
    	}
    	array set gun "$nick 1"
    	putserv "privmsg $chan :$nick YOUR GUN IS NOW RELOADED"
    }
     
    } ;# end namespace

putlog "Bang 2.0 Loaded"
#################################################################################################################################################################
