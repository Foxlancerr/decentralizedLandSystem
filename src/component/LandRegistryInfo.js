function LandRegistryInfo() {
  return (
    <div className="land-registry-info">
      <div className="unique">
        <h1>Current Land</h1>

        <div className="container-flex">
          <p>
            Landed Id: <span>111221</span>
          </p>
          <p>
            Area[inFeets]: <span>3000 feet</span>
          </p>
        </div>
        <div className="container-flex">
          <p>
            City: <span>peshawar</span>
          </p>
          <p>
            state: <span>Pakistan</span>
          </p>
        </div>
        <div className="container-flex">
          <p>
            LandPrize: <span>200$</span>
          </p>
          <p>
            LandVerifyStatus: <span>true</span>
          </p>
        </div>
        <div className="container-flex">
          <p>
            PropertyPID: <span>111221</span>
          </p>
        </div>
      </div>
    </div>
  );
}
export default LandRegistryInfo;
