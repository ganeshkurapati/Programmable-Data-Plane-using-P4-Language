python ../../cli/pd_cli.py -p simple_router -i p4_pd_rpc.simple_router -s $PWD/tests/pd_thrift:$PWD/../../testutils -m "add_entry ssl_rtmp_count_src 1935 _drop" -c localhost:22222
python ../../cli/pd_cli.py -p simple_router -i p4_pd_rpc.simple_router -s $PWD/tests/pd_thrift:$PWD/../../testutils -m "add_entry ssl_rtmp_count_dst 1935 _drop" -c localhost:22222
