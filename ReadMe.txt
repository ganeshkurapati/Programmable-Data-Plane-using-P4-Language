/*-----------------------------Programmable-Data-Plane-using-P4-Language--------------------------------*/

The network data plane should be programmed to decapsulate the outer tag/labels to identify and/or trace 
the packets. This project will use P4, a domain specific programming language to design packet encap/decap
modules that can process packet headers and perform the following tasks:
(a) Identify OpenSSL flows 
(b) Identify video streams from/to a streaming server (assume using MistServer for streaming) 
(c) Identify Youtube streams 
(d) Record and report statistics regarding the above flows

/*--------------------------------------------Contributors---------------------------------------------*/

    - Naga Ganesh Kurrapati    
    - Rakesh Kiran Musalay
    - Ramanand Shankarling
   
/*---------------------------------------Step 1: Set up MistServer-------------------------------------*/
	Reference: https://mistserver.org/documentation
    //From the command line 
    - wget https://r.mistserver.org/dl/mistserver_64V2.10.1.tar.gz -O mist.tgz  //For 64 bit machine
	// For different machine visit: https://mistserver.org/download
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
   