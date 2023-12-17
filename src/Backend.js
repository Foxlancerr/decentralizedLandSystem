/************************************************************************************************
 *  How to connect your solidity smart contract with react.js using ether.js
 *************************************************************************************************/
import React, { useEffect, useState } from "react";
import App from "./App";
import AbiKey from "./sol/AbiKey";
const ethers = require("ethers");





const Backend = () => {
  const smartContractAddress = '0xcB31c712af527b2dF44f1F106923081d56C29e55';

  const DummySellerAddress = '0x783935b2d25A0fbEE1911fa8664b6eDae3551c26';
  const DummyBuyerAddress = '0x4be9D513E0A6A3aAf4D3b321c2CFd1886b073613';

  // usestate hook is defined to store the address
  const [metaMaskAddress, setmetamaskAddress] = useState(
    "0x555c8028be03EAF3eb0EA051c28e2816e8d91eDb"
  );

  // set the contract all methods and function here
  const [contract, setContract] = useState(null);



  /*
      👉 request to smart contract
      ***************************************************************************************************************************
  */
  const requestToSmartContract = async () => {
    try {
      if (window.ethereum) {
        // make a request
        const provider = new ethers.BrowserProvider(window.ethereum);
        // request to metamask account for connection
        const account = await provider.send("eth_requestAccounts", []);
        //signer will help to interect our smart contract
        const signer = await provider.getSigner();
        console.log("connection successful");
        // pass these data to my smart contract and this will verified me
        const deplyContract = new ethers.Contract(
          smartContractAddress,
          AbiKey,
          signer
        );

        setContract(await deplyContract);
      } else {
        console.log("pl connect to your metamask");
      }
    } catch (err) {
      console.log(err.message);
    }
  };

  useEffect(() => {
    requestToSmartContract();
  }, []);

  /*
     *****************************************************************************************
     *****************************************************************************************
                                   Logics related to buyer
     *****************************************************************************************
     *****************************************************************************************
     */
  /*
      👉 register your buyer
      ***************************************************************************************************************************
  */
  const registerNewBuyer = async () => {
    try {
      const newBuyer = await contract.registerBuyer(111, DummyBuyerAddress);
      // console.log('successfully', newBuyer);

      // Wait for the transaction to be mined
      const receipt = await newBuyer.wait();

      console.log('Transaction mined. Receipt:', receipt);

      // Access the transaction status
      if (receipt.status === 1) {
        console.log('Transaction successful!');
      } else {
        console.log('Transaction failed!');
      }
    } catch (err) {
      console.log(err);
    }
  };

  /*
      👉 view your Buyer
      ***************************************************************************************************************************
  */
  const viewBuyerRecord = async () => {
    try {
      const getBuyer = await contract.buyer_mapped(DummyBuyerAddress);
      console.log(getBuyer);
    } catch (err) {
      console.log(err);
    }
  }

  /*
      👉 buyer is verified or not
      ***************************************************************************************************************************
  */
  const isBuyerVerified = async () => {
    try {
      const buyerVerify = await contract.BuyerIsVerified(DummyBuyerAddress);
      console.log('successfully', buyerVerify);
    } catch (err) {
      console.log(err);
    }
  };

  /*
     *****************************************************************************************
     *****************************************************************************************
                                   Logics related to seller
     *****************************************************************************************
     *****************************************************************************************
     */

  /*
      👉 register your seller
      ***************************************************************************************************************************
  */
  const registerNewSeller = async () => {
    try {
      const newSeller = await contract.registerSeller(222, DummySellerAddress);
      // console.log('successfully', newSeller);

      const receipt = await newSeller.wait();

      console.log('Transaction mined. Receipt:', receipt);

      // Access the transaction status
      if (receipt.status === 1) {
        console.log('Transaction successful!');
      } else {
        console.log('Transaction failed!');
      }
    } catch (err) {
      console.log(err);
    }
  };
  /*
      👉 view your seller Record
      ***************************************************************************************************************************
  */
  const viewSellerRecord = async () => {
    try {
      const getSeller = await contract.seller_mapped(DummySellerAddress);
      console.log(getSeller);
    } catch (err) {
      console.log(err);
    }
  }

  /*
     👉 Is seller is verifeid or not
     ***************************************************************************************************************************
 */
  const IsSellerVerified = async () => {
    try {
      const sellerVerify = await contract.SellerIsVerified(DummySellerAddress);
      console.log('successfully', sellerVerify);
    } catch (err) {
      console.log(err.message);
    }
  };

  /*
     *****************************************************************************************
     *****************************************************************************************
                                   Logics related to Land
     *****************************************************************************************
     *****************************************************************************************
     */

  /*
      👉 register your Land
      ***************************************************************************************************************************
  */
  const registerNewLand = async () => {
    try {
      const newLand = await contract.RegisterLand(222, DummySellerAddress)
      // console.log('successfully', newLand);
      const receipt = await newLand.wait();

      console.log('Transaction mined. Receipt:', receipt);

      // Access the transaction status
      if (receipt.status === 1) {
        console.log('Transaction successful!');
      } else {
        console.log('Transaction failed!');
      }
    } catch (err) {
      console.log(err.message);
    }
  };
  /*
      👉 view your land Record
      ***************************************************************************************************************************
  */
  const viewLandRecord = async () => {
    try {
      const getLand = await contract.landRegistry_mapped(222);
      console.log(getLand);
    } catch (err) {
      console.log(err.message);
    }
  }


  /*
     👉 Is Land is verifeid or not
     ***************************************************************************************************************************
 */
  const IsLandVerified = async () => {
    try {
      const landVerify = await contract.LandIsVerified(DummySellerAddress);
      // console.log('successfully', landVerify);
      const receipt = await landVerify.wait();

      console.log('Transaction mined. Receipt:', receipt);

      // Access the transaction status
      if (receipt.status === 1) {
        console.log('Transaction successful!');
      } else {
        console.log('Transaction failed!');
      }
    } catch (err) {
      console.log(err.message);
    }
  };

  /*
     👉 get the land price
     ***************************************************************************************************************************
 */
  const getLandPrice = async () => {
    try {
      const landPrice = await contract.GetLandPrice(222);
      console.log('successfully', (landPrice));
    } catch (err) {
      console.log(err);
    }
  };

  /*
      👉 Buy your plot
      ***************************************************************************************************************************
  */
  const buyNewPlot = async () => {
    try {
      const option = { value: ethers.parseEther("0.00000000000000005") }
      console.log(option.value);
      const newPlot = await contract.buyPlot(DummyBuyerAddress, DummySellerAddress, option)
      // console.log('successfully', newPlot);
      const receipt = await newPlot.wait();

      console.log('Transaction mined. Receipt:', receipt);

      // Access the transaction status
      if (receipt.status === 1) {
        console.log('Transaction successful!');
      } else {
        console.log('Transaction failed!');
      }
    } catch (err) {
      console.log(err.message);
    }
  };






  return (
    <>
      <App contract={contract}></App>
      <button onClick={viewSellerRecord} className="btn">view seller</button>
      <button onClick={registerNewSeller} className="btn">register Seller</button>
      <button onClick={IsSellerVerified} className="btn">isSellerVerified</button>
      <hr />
      <button onClick={viewBuyerRecord} className="btn">view Buyer</button>
      <button onClick={registerNewBuyer} className="btn">register Buyer</button>
      <button onClick={isBuyerVerified} className="btn">isBuyerVerified</button>
      <hr />
      <button onClick={viewLandRecord} className="btn">view Land Record</button>
      <button onClick={registerNewLand} className="btn">RegisterLand</button>
      <button onClick={IsLandVerified} className="btn">isLandVerified</button>
      <hr />
      <button onClick={buyNewPlot} className="btn">buyPlot</button>
      <button onClick={getLandPrice} className="btn">getLandPrice</button>
    </>
  );
};

export default Backend;

