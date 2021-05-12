#!/bin/bash
Stop_sccache_server() {
        if [[ ! -z $(pidof sccache) ]]; then
                sccache --stop-server >> /dev/null
        fi
}


Stop_sccache_server_preinst() {
	if [[ ! -z $(pidof sccache) ]]; then
		info=$(sccache --stop-server)
		einfo "${info}"
	fi
}

BashrcdPhase prepare Stop_sccache_server
BashrcdPhase preinst Stop_sccache_server_preinst
