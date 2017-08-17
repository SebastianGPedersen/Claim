		pragma solidity ^0.4.11;

contract Claim {

    struct SSP {
        address public_address;
        bool approved;
    }
	address[] array;
	uint ArrayLength=0;
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
		for(uint j=0;j<=ArrayLength;j++)
		{
		  if(array[j]==publisher)
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
	function UpdatePublisher() returns (string){
	    bytes storage final1;
	
	    uint f=0;
	for(uint x=0; x<=ArrayLength; x++)
	{
    for(uint i=0; i<=whitelist[array[x]].length; i++)
    {
        if(whitelist[array[x]][i].public_address==msg.sender && whitelist[array[x]][i].approved)
        {
            // In the loop we have 42, which should be the length of address in bytes
	    	bytes memory b = new bytes(42);
            for (uint r = 0; r < 50; r++)
	        {
	             if(42>=r)
                     {b[r] = byte(uint8(uint(array[x]) / (2**(8*(19 - r)))));}
	             else
	                 {b[r]="/";}
            }
            bytes memory b_i_bytes = bytes(b);
            string memory final_length = new string(b_i_bytes.length);
            for(uint y =f; f <= final1.length+b.length;f++){
             final1[f]=b[f-final1.length];
            }
            
    
        }
    }
	}

	return string(final1);
    }
}