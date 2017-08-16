pragma solidity ^0.4.0;

contract MakeClaim {

    struct SSP {
        address public_address;
        bool approved;
    }

    mapping(address => SSP[]) protected publishers;

    modifier onlyBy(address _account) {
        require(msg.sender == _account);
        _;
    }

    function MakeClaim() {
        publisher = msg.sender;
        SSPs = publishers[publisher];       
    }

    function addSSP(address ssp_address) onlyBy(publisher) {

        for(uint i = 0; i < SSPs.length; i++) {
            if(SSPs[i].address == ssp_address) {
                require(false); // Stop execution if the SSP already exists
            }
        }

        publishers[publisher].push(SSP({
            name: ssp_name,
            public_address: ssp_address,
            approved: 0
        }));
    }

    function deleteSSP(ssp_address) onlyBy(publisher) {
        
        uint ssp_index = failOrGetIndexByAddress(ssp_address);
        delete SSPs[ssp_index];
        SSPs.length--;
    }

    function approvePublisher(address _publisher) {
        ssps = publishers[_publisher];
        for(uint i = 0; i < ssps; i++) {
            if(msg.sender = ssps[i].address) ssps[i].approved = true;
        }
    }

    function deletePublisher(address _publisher) {
        ssps = publishers[_publisher];
        for(uint i = 0; i < ssps; i++) {
            if(msg.sender = ssps[i].address) {
                delete ssps[i];
                ssps.length--;
            }
        }
    }

    function failOrGetIndexByAddress(address ssp_address) internal {
        for(uint i = 0; i < SSPs.length; i++) {
            if(SSPs[i].address == ssp_address) return i;
        }
        require(false);
    }
}