<?php
//***********************************************************************************************************************************//
Config::set('site_name', 'MyIPTV');						//Set the name you want for your Panel
Config::set('base_url', '/myiptv/');					//Set the Folder where the panel will be installed (in this example /var/www/myiptv/)
Config::set('languages', array('en', 'fr'));			//Set the languages
Config::set('version', 'Beta 0.01');
//***********************************************************************************************************************************//
Config::set('routes', array(							// Set the routing Options
		'default' => '',
		'admin' => 'admin_', ));
Config::set('default_route', 'default');				// Set the default route --> default.html
Config::set('default_language', 'en');					// Set the default language --> en
Config::set('default_controller', 'pages');
Config::set('default_action', 'index');					// Set the defaut action to open index.html/php
//***********************************************************************************************************************************//
Config::set('stream_svr_url', 'http://54.233.91.111');		// Set the panel url, should be replaced by your ddns --> 'http://ddns'
Config::set('stream_svr_port', '80');					// Set the panel port, default http (used for server admin)
Config::set('panel_chain', 'IPTV_PANEL');				// Set the IPTV Panel chain
Config::set('stream_1st_port', '2000');					// Set the 1st port used for vlc restreaming
Config::set('stream_ech_port', '24225');				// Set the exchange port (used for peers to connect)
Config::set('echange_chain', 'ECH_PANEL');				// Set the Echange chain
//***********************************************************************************************************************************//
Config::set('iptables_cmd', '/sbin/iptables'); 			// IPtables bin
Config::set('fw_cmd', 'ufw'); 							// UFW bin
Config::set('enable_fw', 'ON'); 						// Close all incoming connection not allowed (Admin/Peers)
Config::set('close_svr_port', 'ON'); 					// Firewall Setings: 'stream_svr_port' only open for admin user host
Config::set('close_ech_port', 'ON'); 					// Firewall Setings: 'stream_ech_port' only open for user host
Config::set('net_interface', 'eth0'); 					// Network Interface
//***********************************************************************************************************************************//
Config::set('restream_prog', 'vlc'); 					// Restream Program: vlc/ffmpeg (only vlc in release 0.01)
Config::set('streaming_agent', 'MyIPTV-Agent'); 
Config::set('engine-user', 'www-data');
Config::set('engine-cmd', '/usr/bin/cvlc');
Config::set('network-caching', '3000'); 
Config::set('verbose', '0'); 
Config::set('logfile', '/tmp/');
//***********************************************************************************************************************************//
Config::set('db_prog', 'SQLite3');						// Set db programe SQLite3/MySQL/SQL/... (only SQLite3 in release 0.01)
Config::set('db_Name', 'IPTV_template.db');				// Set default SLQlite3 db
//***********************************************************************************************************************************//
Config::set('cat_un', 'Unassigned');					// Unassigned Category
