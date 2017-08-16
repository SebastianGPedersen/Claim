pragma solidity ^0.4.0;

contract MakeClaim {

    struct SSP {
        address public_address;
        bool approved;
    }

    mapping(address => SSP[]) publishers;

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
            if(SSPs[i].public_address == ssp_address) {
                require(false); // Stop execution if the SSP already exists
            }
        }

        publishers[publisher].push(SSP({
            name: ssp_name,
            public_address: ssp_address,
            approved: false
        }));
    }

    function deleteSSP(ssp_address) onlyBy(publisher) {
        
        uint ssp_index = failOrGetIndexByAddress(ssp_address);
        delete publishers[publisher][ssp_index];
        publishers[publisher].length--;
    }

    function approvePublisher(address _publisher) {
        ssps = publishers[_publisher];
        for(uint i = 0; i < ssps.length; i++) {
            if(msg.sender = ssps[i].public_address) ssps[i].approved = true;
        }
    }

    function deletePublisher(address _publisher) {
        ssps = publishers[_publisher];
        for(uint i = 0; i < ssps.length; i++) {
            if(msg.sender = ssps[i].public_address) {
                delete ssps[i];
                ssps.length--;
            }
        }
    }

    function failOrGetIndexByAddress(address ssp_address) internal {
        for(uint i = 0; i < SSPs.length; i++) {
            if(SSPs[i].public_address == ssp_address) return i;
        }
        require(false);
    }
}