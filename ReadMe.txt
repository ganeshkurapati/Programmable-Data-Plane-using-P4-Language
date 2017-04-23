/*-----------------------------Programmable-Data-Plane-using-P4-Language--------------------------------*/

The network data plane should be programmed to decapsulate the outer tag/labels to identify and/or trace 
the packets. This project will use P4, a domain specific programming language to design packet encap/decap
modules that can process packet headers and perform the following tasks:
(a) Identify OpenSSL flows 
(b) Identify video streams from/to a streaming server (assume using MistServer for streaming) 
(c) Identify Youtube streams 
(d) Record and report statistics regarding the above flows

/*--------------------------------------------Contributors---------------------------------------------*/

    - Naga Ganesh Kurapati    
    - Rakesh Kiran Musalay
    - Ramanand Shankarling
   
/*---------------------------------------Step 1: Set up MistServer-------------------------------------*/
    Reference: https://mistserver.org/documentation
    //From the command line 
    - wget https://r.mistserver.org/dl/mistserver_64V2.10.1.tar.gz -O mist.tgz  //For 64 bit machine
    //For different machine visit: https://mistserver.org/download
    - tar -xf mist.tgz -C /usr/bin
   
    //You’ve now installed MistServer,to run MistServer you can use the following command:
    - MistController
	
    //Accessing the management interface and setting up MistServer
    - http://host-ip-address:4242
	
    //You can access the streaming at 
    //Free version of MistServer support only the following protocols
    Protocol : Syntax
    MP4 : http://HOST:HTTP_PORT/STREAM_NAME.mp4
    RTMP : rtmp://HOST:RTMP_PORT/play/STREAM_NAME
	
    Note: You can access the stream using applications like VLC, Web browser etc.
	
/*---------------------Step 2: Set up QUIC(Youtube) and OpenSSL packets Stream -----------------------*/
    1. Capture QUIC and OpenSSL packets using wireshark. You can also pcap files provides
    2. Now you can modify the packets to replay them between two different host using a sofware suite
       tcpreplay. visit: http://tcpreplay.synfin.net/ for more info.
       a) Install tcpreplay: sudo apt-get install tcpreplay
       b) Can modify MAC address using the command
          tcprewrite --enet-dmac=mac1 --enet-smac=mac2 --infile=input.pcap --outfile=output.pcap
       c) Can modify IP Adress by using the commands
          i) tcpprep --port --cachefile=example.cache --pcap=example.pcap
          ii) tcprewrite --endpoints=ipv4-1:ipv4-2 --cachefile=example.cache --infile=example.pcap --outfile=new.pcap
          visit : http://tcpreplay.synfin.net/wiki/usage
                  http://tcpreplay.synfin.net/wiki/tcprewrite for more info.
    3. To replay the modified packets use Scapy. Visit: http://www.secdev.org/projects/scapy/
       Reference : http://www.secdev.org/projects/scapy/doc/usage.html
                   https://github.com/phaethon/scapy
       a) To install Scapy: sudo apt-get install scapy
       b) Type scapy in the command line to start it.
       c) To send the packets use the command: sendp(rdpcap("/tmp/pcapfile"))

/*---------------------------------------Step 3: Procedure-------------------------------------------*/
    1. Place the "simple_router" floder under targets and do "make bm"
    2. Now you can start the program using the command "./run_demo.bash" // To start topology
    3. From the another command line type "run_add_demo_entries.bash" // To make router to work
    4. Now from host h1, you can start MistController or scapy to send the packets. h2 receives Packets.
    5. To count the packets use following commands
       quic: run_add_demo_entries_quic_count.bash
       ssl: run_add_demo_entries_ssl_count.bash
       rtmp: run_add_demo_entries_rtmp_count.bash
    6. To drop the packets use
       quic: run_add_demo_entries_quic_drop.bash
       ssl: run_add_demo_entries_ssl_drop.bash
       rtmp: run_add_demo_entries_rtmp_drop.bash

    Note: Bash files add entries in the table. They don't modify the entries
   
