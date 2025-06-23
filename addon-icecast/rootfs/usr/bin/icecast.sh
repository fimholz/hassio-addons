#!/command/with-contenv bashio
# shellcheck shell=bash
# ==============================================================================
# Home Assistant Community Add-on: Icecast
#
# Icecast add-on for Home Assistant.
# ------------------------------------------------------------------------------
ICECAST_CONFIG="/config/icecast.xml"

main() {
    bashio::log.trace "${FUNCNAME[0]}"

    /usr/bin/xmledit update "${ICECAST_CONFIG}" "//location" "$(bashio::config 'location')"
    /usr/bin/xmledit update "${ICECAST_CONFIG}" "//admin" "$(bashio::config 'admin')"
    /usr/bin/xmledit update "${ICECAST_CONFIG}" "//hostname" "$(bashio::config 'hostname')"

    /usr/bin/xmledit update "${ICECAST_CONFIG}" "//authentication/source-password" "$(bashio::config 'source_password')"
    /usr/bin/xmledit update "${ICECAST_CONFIG}" "//authentication/relay-password" "$(bashio::config 'relay_password')"
    /usr/bin/xmledit update "${ICECAST_CONFIG}" "//authentication/admin-user" "$(bashio::config 'admin_user')"
    /usr/bin/xmledit update "${ICECAST_CONFIG}" "//authentication/admin-password" "$(bashio::config 'admin_password')"

    /usr/bin/xmledit update "${ICECAST_CONFIG}" "//logging/loglevel" "$(bashio::config 'loglevel')"

    icecast -c "${ICECAST_CONFIG}"
}
main "$@"
