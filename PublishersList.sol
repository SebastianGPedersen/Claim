contract ssp_contract{

     struct ssp_publisher {
        address PublicKey;
        bytes32 name;
        bool approved;
    }
    mapping (address => ssp_publisher[]) private SSPs;

    function UpdatePublisher(address PublisherAddress) {
    PublisherContract publisher = PublisherContract(PublisherAddress)
    while(i<=publisher.publishers.length)
    {
        if(publisher.publishers[i].PublicKey==msg.sender && publisher.publishers[i].approved)
        {
        SSPs[msg.sender].push(publisher.publishers[i]);
        SSPs.length++;
        }
        else
        {
            int j=0;
            while(j<=SSPs.length)
            {
            if(msg.sender==publisher.getPublishers_PublicKey())
            {
                delete SSPs[j];
                SSPs.length--;
            }
            }
        }
    }
    }
}
