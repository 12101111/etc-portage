#!/bin/bash
warn_overlay_change_pretend() {
	if [[ ! -z "${REPLACING_VERSIONS}" ]]; then
		overlay_from=$(cat "${EROOT}/var/db/pkg/${CATEGORY}/${PN}-${REPLACING_VERSIONS}/repository")
		if [[ "${overlay_from}" != "${PORTAGE_REPO_NAME}" ]]; then
			ewarn "${CATEGORY}/${PN} used to be installed from ::${overlay_from},"
			ewarn "but is now going to be installed from ::${PORTAGE_REPO_NAME} now!"
		fi
	fi
}

warn_overlay_change_preinst() {
	if [[ ! -z "${REPLACING_VERSIONS}" ]]; then
		overlay_from=$(cat "${EROOT}/var/db/pkg/${CATEGORY}/${PN}-${REPLACING_VERSIONS}/repository")
		if [[ "${overlay_from}" != "${PORTAGE_REPO_NAME}" ]] &&
			[[ "${overlay_from}" == "12101111-overlay" ]] &&
			[[ -z ${I_KNOW_WHAT_I_AM_DOING} ]]; then
			die "Don't break your system"
		fi
	fi
}

BashrcdPhase setup warn_overlay_change_pretend
BashrcdPhase preinst warn_overlay_change_preinst
