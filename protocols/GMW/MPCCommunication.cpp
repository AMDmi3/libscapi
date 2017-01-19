//
// Created by moriya on 04/01/17.
//

#include "MPCCommunication.h"


vector<shared_ptr<ProtocolPartyData>> MPCCommunication::setCommunication(boost::asio::io_service & io_service, int id, int numParties, string configFile) {
cout<<"in communication"<<endl;

cout<<"num parties = "<<numParties<<endl;
    vector<shared_ptr<ProtocolPartyData>> parties(numParties - 1);

    //open file
    ConfigFile cf(configFile);

    string portString, ipString;
    vector<int> ports(numParties);
    vector<string> ips(numParties);

    int counter = 0;
    for (int i = 0; i < numParties; i++) {
        portString = "party_" + to_string(i) + "_port";
        ipString = "party_" + to_string(i) + "_ip";

        //get partys IPs and ports data
        ports[i] = stoi(cf.Value("", portString));
        ips[i] = cf.Value("", ipString);
    }

    SocketPartyData me, other;

    for (int i=0; i<numParties; i++){
        if (i < id) {// This party will be the receiver in the protocol

            me = SocketPartyData(boost_ip::address::from_string(ips[id]), ports[id] + i);
            cout<<"my port = "<<ports[id] + i<<endl;
            other = SocketPartyData(boost_ip::address::from_string(ips[i]), ports[i] + id - 1);
            cout<<"other port = "<<ports[i] + id - 1<<endl;

            shared_ptr<CommParty> channel = make_shared<CommPartyTCPSynced>(io_service, me, other);
            // connect to party one
            channel->join(500, 5000);
            cout<<"channel established"<<endl;

            cout<<"receiver port = "<<ports[i]+ numParties -2 + id<<endl;
            OTExtensionBristolReceiver* receiver = new OTExtensionBristolReceiver(ips[i], ports[i]+ numParties -2 + id, true, nullptr);
            cout<<"sender port = "<<ports[id] + numParties - 2 + i<<endl;
            OTExtensionBristolSender* sender = new OTExtensionBristolSender(ports[id] + numParties - 1 + i, true, nullptr);

            parties[counter++] = make_shared<ProtocolPartyData>(i, channel, sender, receiver);
        } else if (i>id) {// This party will be the sender in the protocol
            me = SocketPartyData(boost_ip::address::from_string(ips[id]), ports[id] + i - 1);
            cout<<"my port = "<<ports[id] + i - 1<<endl;
            other = SocketPartyData(boost_ip::address::from_string(ips[i]), ports[i] + id);
            cout<<"other port = "<< ports[i] + id<<endl;

            shared_ptr<CommParty> channel = make_shared<CommPartyTCPSynced>(io_service, me, other);
            // connect to party one
            channel->join(500, 5000);
            cout<<"channel established"<<endl;
            cout<<"sender port = "<<ports[id] + numParties - 2 + i<<endl;
            OTExtensionBristolSender* sender = new OTExtensionBristolSender(ports[id] + numParties - 2 + i, true, nullptr);
            cout<<"receiver port = "<<ports[i]+ numParties -1 + id<<endl;
            OTExtensionBristolReceiver* receiver = new OTExtensionBristolReceiver(ips[i], ports[i]+ numParties -1 + id, true, nullptr);


            parties[counter++] = make_shared<ProtocolPartyData>(i, channel, sender, receiver);
        }
    }

    return parties;

}