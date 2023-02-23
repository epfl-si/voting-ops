#!/bin/bash
dela_bin="{{ dela_bin_dir }}/memcoin-linux-amd64-{{ dela_bin_version }}"

# internal socket for the delanode for inter-node communication (gRPC, this is the destination for the public reverse proxy)
dela_listen="//0.0.0.0:{{ dela_listen_port }}"

dela_data="{{ delat_data_dir }}"

# listen address for 
prometheus_addr="0.0.0.0:9100" 

# http proxy for the node (serving the rest api)
proxy_addr="127.0.0.1:4000"

# The address that is published so the other nodes can access this one
# Once the proxy is configured this has to change port
dela_public="//{{ inventory_hostname }}:{{ dela_public_port }}"

# The public key allowing the backend to communicate to the API 
dela_proxy_pk="adbacd10fdb9822c71025d6d00092b8a4abb5ebcb673d28d863f7c7c5adaddf3"



echo "Starting ${dela_bin} on ${dela_listen} using folder ${dela_data} ..."

# debug level
export LLVL=info # warn debug

${dela_bin} \
    --config ${dela_data} \
    start \
    --postinstall \
    --promaddr ${prometheus_addr} \
    --proxyaddr ${proxy_addr} \
    --listen ${dela_listen} \
    --public ${dela_public} \
    --proxykey ${dela_proxy_pk} \
    --routing flat \
    --noTLS=true

# this is for internal TLS. Better to use the reverse proxy for this
#    --certKey ${dela_cert_key} \
#    --certChain ${dela_cert_chain} \

