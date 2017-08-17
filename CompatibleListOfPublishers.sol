mapping (address => SSP[]) private Publishers_for_SSP;
    
    function UpdatePublisher(address publisherKey) {
        int i=0;
    for(int i=0; i<=whitelist.length; i++)
    {
        if(whitelist[i].public_address==msg.sender && whitelist[i].approved)
        {
        Publishers_for_SSP[msg.sender].push(whitelist[i]);
        Publishers_for_SSP.length++;
        }
        else
        {
            int j=0;
            while(j<=Publishers_for_SSP.length)
            {
            if(Publishers_for_SSP[j].public_address==publisherKey)
            {
                remove(publisherKey, msg.sender);
                Publishers_for_SSP.length--;
            }
            }
        }
    }
    }
