import React from "react";
import Navbar from "./component/Navbar.js";
import Footer from "./component/Footer.js";
import BuyPlot from "./component/BuyPlot.js";
import Register from "./component/Register.js";
import Verification from "./component/Verification.js";
const LandRegistration = (props) => {
  console.log(props);
  return (
    <div className="parent">
      <div className="upper-part">
      <Navbar/>
      {/* <Register></Register> */}
      <BuyPlot></BuyPlot> 
      {/* <Verification></Verification> */}
      </div>
      <Footer/>
    </div>
  );
};

export default LandRegistration;
