python ../../cli/pd_cli.py -p simple_router -i p4_pd_rpc.simple_router -s $PWD/tests/pd_thrift:$PWD/../../testutils -m "add_entry quic_count_src 443 count_quic" -c localhost:22222
python ../../cli/pd_cli.py -p simple_router -i p4_pd_rpc.simple_router -s $PWD/tests/pd_thrift:$PWD/../../testutils -m "add_entry quic_count_dst 443 count_quic" -c localhost:22222
