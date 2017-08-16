pragma solidity ^0.4.0;

contract ApproveClaim {

    function ApproveClaim(address MakeClaimContract) {
        MakeClaim claimContract = MakeClaim(MakeClaimContract);
    }

    function approvePublisher(address publisher) {
        claimContract.approvePublisher(publisher);
    }

    function deletePublisher(address publisher) {
        claimContract.deletePublisher(publisher);
    }
    
}