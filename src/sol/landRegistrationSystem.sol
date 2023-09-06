// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

// 👉 Every thing is okay and this is finalized

// 6:09 pm
// Friday, 14 July 2023 (GMT+5)
// Time in Hayatabad, Peshawar

/*
        👉 Just for Testing
        ***************************************************************************************************************************
    */

// last addresses
// =====>   buyers
// keyAddress1:   0x583031D1113aD414F02576BD6afaBfb302140225         😍last2nd

// =====>   Seller
// keyAddress1:   0xdD870fA1b7C4700F2BD7f44238821C26f7392148         😍last

contract LandRegistrationSystem {
    /*
        👉 constructer is declared,and set landinspecter data by default
        ***************************************************************************************************************************
    */
    constructor() {
        // when we deply contract the function  CreateLandInspecter is called
        registerLandInspecter();
    }

    /*
    *************************************************************************
    *************************************************************************
                             struct is declared here
    *************************************************************************
    *************************************************************************
*/

    /*
        👉 BUYER struct is created
        ***************************************************************************************************************************
    */
    struct BUYERS {
        address payable Key;
        string Name;
        uint256 Age;
        string City;
        uint256 CNIC;
        string Email;
        uint256 Money;
        bool VerificationStatus;
    }
    /*
        👉 SELLER struct is created
        ***************************************************************************************************************************
    */
    struct SELLER {
        address payable Key;
        string Name;
        uint256 Age;
        string City;
        uint256 CNIC;
        string Email;
        uint256 Money;
        bool VerificationStatus;
    }

    /*
        👉 LANDINSPECTER struct is created
        ***************************************************************************************************************************
    */
    struct LANDINSPECTER {
        address Key;
        string Name;
        uint256 Age;
        string Designation;
    }

    /*
        👉 LANDREGISTRY struct is created
        ***************************************************************************************************************************
    */
    struct LANDREGISTRY {
        uint256 LandedId;
        uint256 Area;
        string City;
        string State;
        uint256 LandPrice;
        bool LandVerifyStatus;
        address PropertyPID;
    }

    // seller and buyers record are store in the Nadra
    uint256[] NadraData = [111, 222, 333, 444, 555, 666, 777, 888, 999];

    /*
    
    *************************************************************************
    *************************************************************************
                             mapping is declared here
    *************************************************************************
    *************************************************************************
    */
    mapping(address => SELLER) public seller_mapped;
    mapping(address => BUYERS) public buyer_mapped;
    mapping(uint256 => LANDINSPECTER) landInspecter_mapped;
    mapping(uint256 => LANDREGISTRY) public landRegistry_mapped;

    /*
    *************************************************************************
    *************************************************************************
                             modifier is declared here
    *************************************************************************
    *************************************************************************
    */

    modifier onlyLandInspecter() {
        require(
            landInspecter_mapped[1].Key == msg.sender,
            unicode"Sorry!😡 you are not a valid LandInspecter"
        );
        _;
    }

    /*
    *************************************************************************
    *************************************************************************
                        all different events are mention
    *************************************************************************
    *************************************************************************
    */

    event VerifiedOrNoT(bool VerifY, string MessagE);
    event TransictionRecorD(
        address BuyerAddresS,
        address SellerAddresS,
        uint256 AmounT,
        string MessagE
    );
    event LandPurchaseD(string MessagE);

    /*
    *************************************************************************
    *************************************************************************
                            fill inspecter details
    *************************************************************************
    *************************************************************************
    */

    /*
        👉 register the land inspecter 
        ***************************************************************************************************************************
                👉constructer will called this function
    */
    function registerLandInspecter() private {
        landInspecter_mapped[1] = LANDINSPECTER({
            Key: msg.sender,
            Name: "ahmad",
            Age: 34,
            Designation: "peshawar"
        });
    }

    /*
        👉 return who is the current inspecter
        ***************************************************************************************************************************
    */
    function CurrentLandInspecter() public view returns (string memory) {
        return landInspecter_mapped[1].Name;
    }

    /*
        👉 Just for Testing
        ***************************************************************************************************************************
    */

    // last addresses
    // =====>   buyers
    // keyAddress1:   0x583031D1113aD414F02576BD6afaBfb302140225         😍last2nd

    // =====>   Seller
    // keyAddress1:   0xdD870fA1b7C4700F2BD7f44238821C26f7392148         😍last 

    /*
    *************************************************************************
    *************************************************************************
                             all about seller - logics
    *************************************************************************
    *************************************************************************
    */

    /*
        👉 register your seller
        ***************************************************************************************************************************
    */

    function registerSeller(uint256 _cnic, address _address)
        public
        returns (string memory)
    {
        seller_mapped[_address] = SELLER({
            Key: payable(_address),
            Name: unicode"Seller 😡",
            Age: 40,
            City: "PeshawarSeller",
            CNIC: _cnic,
            Email: "Seller@gmail.com",
            Money: 150,
            VerificationStatus: false
        });

        return unicode"Congrat's 😍 the Seller is successfully register";
    }

    /*
        👉 check the seller is verified or not
        ***************************************************************************************************************************
    */
    function SellerIsVerified(address _address)
        public
        returns (bool verify, string memory)
    {
        string memory message;
        bool Verify;
        // check buyer is registered or not
        if (seller_mapped[_address].CNIC != 0) {
            // for loap to check nadraRecord array to iterate with each index to match the seller CNIC is exist or not
            for (uint256 i = 0; i < NadraData.length; i++) {
                if (seller_mapped[_address].CNIC == NadraData[i]) {
                    seller_mapped[_address].VerificationStatus = true;

                    // verifiedOrNot emit is fire here
                    emit VerifiedOrNoT(
                        true,
                        unicode"Congrat's 😍 the seller is verified from Nadra"
                    );

                    Verify = true;
                    message = unicode"Congrat's 😍 the seller is verified from Nadra";
                    return (Verify, message);
                } else {
                    Verify = false;
                    message = unicode"Sorry!😡 no record found in Nadra database";
                }
            }
        } else {
            Verify = false;
            message = unicode"Sorry!😡 First register yourself through  ***REGISTER_SELLER***";
        }
        return (Verify, message);
    }

    /*
    *************************************************************************
    *************************************************************************
                             all about buyers - logics
    *************************************************************************
    *************************************************************************
    */

    /*
        👉 register your new buyer
        ***************************************************************************************************************************
    */

    function registerBuyer(uint256 _cnic, address _address)
        public
        returns (string memory)
    {
        buyer_mapped[_address] = BUYERS({
            Key: payable(_address),
            Name: unicode"Buyer 🤭",
            Age: 30,
            City: "peshawarBuyer",
            CNIC: _cnic,
            Email: "buyer@gmail.com",
            Money: 100,
            VerificationStatus: false
        });

        return unicode"Congrat's 😍 the buyer is successfully register";
    }

    /*
        👉 check the buyers is verified or not
        ***************************************************************************************************************************
    */

    function BuyerIsVerified(address _address)
        public
        returns (bool verify, string memory)
    {
        string memory message;
        bool Verify;
        // check buyer is registered or not
        if (buyer_mapped[_address].CNIC != 0) {
            // for loap to check nadraRecord array to iterate with each index to match the seller CNIC is exist or not
            for (uint256 i = 0; i < NadraData.length; i++) {
                if (buyer_mapped[_address].CNIC == NadraData[i]) {
                    buyer_mapped[_address].VerificationStatus = true;

                    // verifiedOrNot emit is fire here
                    emit VerifiedOrNoT(
                        true,
                        unicode"Congrat's 😍 the buyer is verified from Nadra"
                    );

                    Verify = true;
                    message = unicode"Congrat's 😍 the buyer is verified from Nadra";
                    return (Verify, message);
                } else {
                    Verify = false;
                    message = unicode"Sorry!😡 record of buyer is not found in Nadra database";
                }
            }
        } else {
            Verify = false;
            message = unicode"Sorry!😡 First register yourself through  ***REGISTER_BUYER***";
        }
        return (Verify, message);
    }

    /*
        👉 Just for Testing
        ***************************************************************************************************************************
    */

    // last addresses
    // =====>   buyers
    // keyAddress1:   0x583031D1113aD414F02576BD6afaBfb302140225         😍last2nd

    // =====>   Seller
    // keyAddress1:   0xdD870fA1b7C4700F2BD7f44238821C26f7392148         😍last

    /*
     *****************************************************************************************
     *****************************************************************************************
                                   Logics related to Land
     *****************************************************************************************
     *****************************************************************************************
     */

    /*
        👉 register your land.
        ***************************************************************************************************************************
    */

    function RegisterLand(uint256 _key, address _address)
        public
        returns (string memory)
    {
        landRegistry_mapped[_key] = LANDREGISTRY({
            LandedId: _key,
            Area: 500,
            City: "peshawar",
            State: "pakistan",
            LandPrice: 10 wei,
            LandVerifyStatus: false,
            PropertyPID: _address //address match to the seller address for property verifcation
        });

        return unicode"Congrat's 😍 The land is successfully registered";
    }

    /*
        👉 check the land is verified or not.
        ***************************************************************************************************************************
    */
    function LandIsVerified(address _address)
        public
        returns (bool, string memory)
    {
        // check the address have seller account or not
        if (seller_mapped[_address].CNIC != 0) {
            // if there have land regiter with this address
            if (
                landRegistry_mapped[seller_mapped[_address].CNIC].LandedId != 0
            ) {
                // seller unique address is equal or not to the landregistry propertyId
                if (
                    seller_mapped[_address].Key ==
                    landRegistry_mapped[seller_mapped[_address].CNIC]
                        .PropertyPID
                ) {
                    landRegistry_mapped[seller_mapped[_address].CNIC]
                        .LandVerifyStatus = true;

                    // verifiedOrNot emit is fire here
                    emit VerifiedOrNoT(
                        true,
                        unicode"Congrat's 😍 Land is verified"
                    );

                    return (true, unicode"Congrat's 😍 Land is verified");
                } else {
                    return (false, unicode"Sorry!😡 Land is not verified");
                }
            } else {
                return (
                    false,
                    unicode"Sorry!😡 no land is registered with this address"
                );
            }
        } else {
            return (
                false,
                unicode"Sorry!😡 no seller is registered with this address"
            );
        }
    }

    /*
        👉 return the name of LandOwner 
        ***************************************************************************************************************************
    */
    function LandsOwner(uint256 _landedId) public view returns (string memory) {
        // if land are registered with this id
        require(
            landRegistry_mapped[_landedId].LandedId != 0,
            unicode"Sorry!😡 there are no Land registers with this LandedId "
        );
        address ownerAddress = landRegistry_mapped[_landedId].PropertyPID;

        // owner are not intrested to sell the land
        require(
            seller_mapped[ownerAddress].CNIC != 0,
            unicode"Sorry!😡 land is register but owner not sell the land"
        );

        return seller_mapped[ownerAddress].Name;
    }

    /*
        👉 return the Land City
        ***************************************************************************************************************************
    */
    function GetLandCity(uint256 _landedId)
        public
        view
        returns (string memory)
    {
        require(
            landRegistry_mapped[_landedId].LandedId != 0,
            unicode"Sorry!😡 no record found, first register the Land"
        );
        return landRegistry_mapped[_landedId].City;
    }

    /*
        👉 return the LandArea
        ***************************************************************************************************************************
    */
    function GetLandArea(uint256 _landedId)
        public
        view
        returns (uint256, string memory)
    {
        if (landRegistry_mapped[_landedId].LandedId != 0) {
            return (
                landRegistry_mapped[_landedId].Area,
                unicode"Congrat's 😍 success"
            );
        } else {
            return (
                landRegistry_mapped[_landedId].Area,
                unicode"Sorry!😡 there are no record found,first register the Land"
            );
        }
    }

    /*
        👉 return the Land Price
        ***************************************************************************************************************************
    */
    function GetLandPrice(uint256 _landedId)
        public
        view
        returns (uint256, string memory)
    {
        if (landRegistry_mapped[_landedId].LandedId != 0) {
            return (
                landRegistry_mapped[_landedId].LandPrice,
                unicode"Congrat's 😍 The Land Price is Getted"
            );
        } else {
            return (
                landRegistry_mapped[_landedId].Area,
                unicode"Sorry!😡 there are no record found,first register the Land"
            );
        }
    }

    /*
        👉 Just for Testing
        ***************************************************************************************************************************
    */

    // last addresses
    // =====>   buyers
    // keyAddress1:   0x583031D1113aD414F02576BD6afaBfb302140225         😍last2nd

    // =====>   Seller
    // keyAddress1:   0xdD870fA1b7C4700F2BD7f44238821C26f7392148         😍last

    /*
    *************************************************************************
    *************************************************************************
                             owner ship transfer - logics
    *************************************************************************
    *************************************************************************
    */

    /*
        👉 withdraw logics are here
        ***************************************************************************************************************************
        // 1 ether = 1000000000000000000 wei;
         👉 to get 1 wei we divide
                                           msg.sender / 1000000000000000000

    */
    function paymentstatus(address _buyer, address _seller)
        public
        payable
        returns (bool, string memory)
    {
        // uint256 amount = msg.value / 1000000000000000000;
        uint256 amount = msg.value;
        // if landprice is equal to the amount they payed then ownership is transfer
        if (
            amount == landRegistry_mapped[seller_mapped[_seller].CNIC].LandPrice // this will update later,because the amount == landRegistry_mapped[seller_mapped[_seller].CNIC].LandPrice
        ) {
            // in here we can transfer the amounts
            address payable reciever = payable(seller_mapped[_seller].Key);
            reciever.transfer(msg.value);

            // in here we can set the front end to update the moneys
            seller_mapped[_seller].Money += msg.value / 1000000000000000000;
            buyer_mapped[_buyer].Money -= msg.value / 1000000000000000000;

            // transiction emit are fired
            emit TransictionRecorD(
                _buyer,
                _seller,
                amount,
                unicode"Congrat's 😍 The Payment is Successfully Transfer"
            );

            return (
                true,
                unicode"Congrat's 😍 The Payment is Successfully Transfer"
            );
        } else {
            // transiction emit are fired
            emit TransictionRecorD(
                _buyer,
                _seller,
                amount,
                unicode"Sorry!😡 the amount which you paid is less then to the land Price"
            );
            return (
                false,
                unicode"Sorry!😡 the amount which you paid is less then to the land Price"
            );
        }
    }

    /*
        👉 purchase land from seller
        ***************************************************************************************************************************
                    👉this function will the head of all ownership related logics function
    */
    function buyPlot(address _buyer, address _seller)
        public
        payable
        returns (string memory)
    {
        // (bool isLandVerify, ) = LandIsVerified(_seller);
        // in here check that the land is verified or not
        if (buyer_mapped[_buyer].VerificationStatus) {
            // check seller is verify or not
            if (seller_mapped[_seller].VerificationStatus) {
                // check land is verify or not
                if (
                    landRegistry_mapped[seller_mapped[_seller].CNIC]
                        .LandVerifyStatus
                ) {
                    // if (isLandVerify) {
                    // call the paymentStatus function
                    (bool status, ) = paymentstatus(_buyer, _seller);

                    // call the setNewowner function
                    string memory propertyConfirmation = setNewowner(
                        status,
                        _buyer,
                        _seller
                    );

                    return propertyConfirmation;
                } else {
                    return unicode"Sorry!😡 The Land is not Verified";
                }
            } else {
                return unicode"Sorry!😡 The Seller is not Verified";
            }
        } else {
            return unicode"Sorry!😡 The Buyers or not Verified";
        }
    }

    /*
        👉 Just for Testing
        ***************************************************************************************************************************
    */

    // last addresses
    // =====>   buyers
    // keyAddress1:   0x583031D1113aD414F02576BD6afaBfb302140225         😍last2nd

    // =====>   Seller
    // keyAddress1:   0xdD870fA1b7C4700F2BD7f44238821C26f7392148         😍last

    /*
        👌perfect work and not change it again
        👉 this will set new owner which purchase land
        ***************************************************************************************************************************
    */
    function setNewowner(
        bool MoneyStatus,
        address _buyer,
        address _seller
    ) private returns (string memory) {
        require(
            MoneyStatus == true,
            unicode"Sorry!😡 the amount should be equal to the Land Price"
        );

        // convertion of buyer to seller and seller to buyer
        convertionOfBuyerToSeller(_buyer, _seller);

        // emit landpurchase is fired
        emit LandPurchaseD(unicode"Congrat's 😍 The Buyer purchase the Land");

        // return the values
        return unicode"Congrat's 😍 The Buyer purchase the Land";
    }

    /*
        this function will perform the following functionality
            👉  transfer land from seller to buyers
            👉  the buyer become seller,because it is the current owner
            👉  the seller become buyer,because it will sell the land 
        ***************************************************************************************************************************
    */

    // point noted
    //       👉 if seller want to give land without charging any cost we can used this function
    function convertionOfBuyerToSeller(address _buyer, address _seller)
        public
        returns (string memory)
    {
        //👌perfect work and not change it again
        // transfer the land ownership to the new buyer
        landRegistry_mapped[buyer_mapped[_buyer].CNIC] = LANDREGISTRY({
            LandedId: buyer_mapped[_buyer].CNIC,
            Area: landRegistry_mapped[seller_mapped[_seller].CNIC].Area,
            City: landRegistry_mapped[seller_mapped[_seller].CNIC].City,
            State: landRegistry_mapped[seller_mapped[_seller].CNIC].State,
            LandPrice: landRegistry_mapped[seller_mapped[_seller].CNIC]
                .LandPrice = 900,
            LandVerifyStatus: landRegistry_mapped[seller_mapped[_seller].CNIC]
                .LandVerifyStatus,
            PropertyPID: buyer_mapped[_buyer].Key
        });

        //👌perfect work and not change it again
        // remove the old seller land from the land_registry
        landRegistry_mapped[seller_mapped[_seller].CNIC] = LANDREGISTRY({
            LandedId: 0,
            Area: 0,
            City: "",
            State: "",
            LandPrice: 0,
            LandVerifyStatus: false,
            PropertyPID: 0x0000000000000000000000000000000000000000
        });

        //👌perfect work and not change it again
        // added the new buyer into seller_mapped because,its new owner

        seller_mapped[_buyer] = SELLER({
            Key: buyer_mapped[_buyer].Key,
            Name: buyer_mapped[_buyer].Name,
            Age: buyer_mapped[_buyer].Age,
            City: buyer_mapped[_buyer].City,
            CNIC: buyer_mapped[_buyer].CNIC,
            Email: buyer_mapped[_buyer].Email,
            Money: buyer_mapped[_buyer].Money,
            VerificationStatus: buyer_mapped[_buyer].VerificationStatus
        });

        //👌perfect work and not change it again
        //add the seller in the buyer mapped because he is no longer the seller,because it sell the land
        buyer_mapped[_seller] = BUYERS({
            Key: seller_mapped[_seller].Key,
            Name: seller_mapped[_seller].Name,
            Age: seller_mapped[_seller].Age,
            City: seller_mapped[_seller].City,
            CNIC: seller_mapped[_seller].CNIC,
            Email: seller_mapped[_seller].Email,
            Money: seller_mapped[_seller].Money,
            VerificationStatus: seller_mapped[_seller].VerificationStatus
        });

        //👌perfect work and not change it again
        // remove the old buyer from the buyer_mapped,because he is owner of the land Now
        buyer_mapped[_buyer] = BUYERS({
            Key: payable(0x0000000000000000000000000000000000000000),
            Name: "",
            Age: 0,
            City: "",
            CNIC: 0,
            Email: "",
            Money: 0,
            VerificationStatus: false
        });

        //👌perfect work and not change it again
        // remove the old seller from the seller_mapped
        seller_mapped[_seller] = SELLER({
            Key: payable(0x0000000000000000000000000000000000000000),
            Name: "",
            Age: 0,
            City: "",
            CNIC: 0,
            Email: "",
            Money: 0,
            VerificationStatus: false
        });

        return unicode"😵conversion done";
    }

    /*
        👉 Just for Testing
        ***************************************************************************************************************************
    */

    // last addresses
    // =====>   buyers
    // keyAddress1:   0x583031D1113aD414F02576BD6afaBfb302140225         😍last2nd

    // =====>   Seller
    // keyAddress1:   0xdD870fA1b7C4700F2BD7f44238821C26f7392148         😍last
}
