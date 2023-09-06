function SellerInfo(){
    return(
        <div className="seller-info">
          <div className="unique">
            <h1>Current Seller</h1>
            <p>Key: <span>key</span></p>
            <div className="container-flex">
              <p>Name: <span>Ahmad</span></p>
              <p>Cnic: <span>cnic</span></p>
            </div>
            <div className="container-flex">
              <p>Age: <span>age</span></p>
              <p>City: <span>city</span></p>
            </div>
            <div className="container-flex">
              <p>Money: <span>money</span></p>
              <p>VerificationStatus: <span>true</span></p>
            </div>
          </div>
        </div>
    )
}

export default SellerInfo;