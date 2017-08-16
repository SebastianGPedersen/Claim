pragma solidity ^0.4.0;

contract AdvertisingApproval{
    string[] Advertisers;
    string[] Advertiserskey;
    uint i=0;
    string publickey;
    
    // Setting the public key
    SetPublicKey(string k){
        publickey=k;
    }
    
    // funktionen der tilføjer en autoriseret udgiver
    function AddAdvertiser(string x, string p){
    Advertisers.length+=1;
    Advertisers[i]=x;
    Advertiserskey[i]=p;
    i++;
    }
    
    // funktionen der sletter en udgiver
    function DeleteAdvertiser(string y){
        int j=0;
        while(Advertisers[j]!=y && j<i)
        {
            j++;
        }
        if(j>=i){
            throw new Execption("Advertiser not found");
        }
        else{
            while(j<i-1){
                Advertisers[j]=Advertisers[j+1];
                Advertiserskey[j]=Advertiserskey[j+1];
            }
            i--;
        }
    }
}