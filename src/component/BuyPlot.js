import SellerInfo from "./SellerInfo";
import LandRegistryInfo from "./LandRegistryInfo";
function BuyPlot() {
  return (
    <div className="buy-plot">
      <div className="form-container">
        <h1 className="form-heading">buy land</h1>
        <form action="#" className="form">
          <div className="input-group">
            <label htmlFor="amount">Amount</label>
            <input
              type="text"
              name="amount"
              id="amount"
              className="input-box"
            />
          </div>
          <div className="input-group">
            <label htmlFor="seller">Seller Address</label>
            <input type="text" name="amount" id="buyer" className="input-box" />
          </div>
          <div className="input-group">
            <label htmlFor="buyer">Buyer Address</label>
            <input
              type="text"
              name="amount"
              id="seller"
              className="input-box"
            />
          </div>
          <button className="btn btn-primary">Buy Land</button>
        </form>
      </div>
      <div className="right-info">
        <SellerInfo></SellerInfo>
        <LandRegistryInfo></LandRegistryInfo>
        <SellerInfo></SellerInfo>
      </div>
    </div>
  );
}

export default BuyPlot;
