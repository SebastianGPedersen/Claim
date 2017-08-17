		pragma solidity ^0.4.11;

contract Claim {

    struct SSP {
        address public_address;
        bool approved;
    }
	address[] array;
	int ArrayLength=0;
    mapping(address => SSP[]) whitelist;

    function publisher_add_supply_side_partner(address ssp) {
	    
        address publisher = msg.sender;
        
        // Does the SSP already exists?
        for(uint i = 0; i < whitelist[publisher].length; i++) {
            if(ssp == whitelist[publisher][i].public_address) {
                // Stop execution if the SSP already exists
                require(false); 
            }
        }
        
        //Adds a publisher to the array, if doesn't exist there.
		bool t=true;
		for(int i=0;i<=ArrayLength;i++)
		{
		  if(array(i)==publisher)
		  {
		  t=false;
		  }
		}
		if(t)
		{
		ArrayLength++;
		array[ArrayLength]=publisher;
		}


        whitelist[publisher].push(SSP({
            public_address: ssp,
            approved: false
        }));
    }

    function publisher_delete_supply_side_partner(address ssp) {
        address publisher = msg.sender;
        remove(publisher, ssp);
    }

    function ssp_approve_publisher(address publisher) {
        address ssp = msg.sender;
        for(uint i = 0; i < whitelist[publisher].length; i++) {
            if(ssp == whitelist[publisher][i].public_address) {
                whitelist[publisher][i].approved = true;
            }
        }
    }

    function ssp_delete_publisher(address publisher) {
        address ssp = msg.sender;
        remove(publisher, ssp);
    }

    function remove(address publisher, address ssp) private {
        for(uint i = 0; i < whitelist[publisher].length; i++) {
            if(ssp == whitelist[publisher][i].public_address) {
                delete whitelist[publisher][i];
                whitelist[publisher].length--;
            }
        }
    }


	//*****
	//variable final is a long string with all the addresses
	function UpdatePublisher() return (string){
	for(int x=0; x<=ArrayLength; x++)
	{
    for(int i=0; i<=whitelist[array[x]].length; i++)
    {
        if(whitelist[array[x]][i].public_address==msg.sender && whitelist[array[x]][i].approved)
        {
	    	bytes memory b = new bytes(42);
            for (uint r = 0; r < 50; r++)
	        {
	             if(42>=r)
                     {b[r] = byte(uint8(uint(array[x]) / (2**(8*(19 - r)))));}
	             else
	                 {b[r]="/";}
            }
	        f+=50;
	        for(uint r = 0; r < 50; r++)
	        {
	            final[f]=b[r];
	            f++;
	        }
        }
    }
	}
	return final;
    }
}