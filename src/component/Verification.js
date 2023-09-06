function Verification() {
  return (
    <div className="verified">
      <p>
        <h1 className="form-heading">Verify Buyer</h1>
        <form action="#" className="form">
          <div className="input-group">
            <label htmlFor="address">key[Address]</label>
            <input
              type="text"
              name="address"
              id="address"
              className="input-box"
            />
          </div>
          <button className="btn btn-primary">Register</button>
        </form>
      </p>
      <p className="landVerify">
        <h1 className="form-heading">Verify Land</h1>
        <form action="#" className="form">
          <div className="input-group">
            <label htmlFor="address">key[Address]</label>
            <input
              type="text"
              name="address"
              id="address"
              className="input-box"
            />
          </div>
          <button className="btn btn-primary">Register</button>
        </form>
      </p>
      <p>
        <h1 className="form-heading">Verify Seller</h1>
        <form action="#" className="form">
          <div className="input-group">
            <label htmlFor="address">key[Address]</label>
            <input
              type="text"
              name="address"
              id="address"
              className="input-box"
            />
          </div>
          <button className="btn btn-primary">Register</button>
        </form>
      </p>
    </div>
  );
}

export default Verification;
