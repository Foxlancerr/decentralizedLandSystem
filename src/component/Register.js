function Register() {
  return (
    <div className="register">
      <h1 className="form-heading">Register Buyer</h1>
      <form action="#" className="form">
        <div className="input-group">
          <label htmlFor="key">key[Address]</label>
          <input type="text" name="key" id="key" className="input-box" />
        </div>
        <div className="input-group">
          <label htmlFor="name">Name</label>
          <input type="text" name="name" id="name" className="input-box" />
        </div>
        <div className="input-group">
          <label htmlFor="age">Age</label>
          <input type="text" name="age" id="age" className="input-box" />
        </div>
        <div className="input-group">
          <label htmlFor="city">City</label>
          <input type="text" name="city" id="city" className="input-box" />
        </div>
        <div className="input-group">
          <label htmlFor="cnic">CNIC</label>
          <input type="text" name="cnic" id="cnic" className="input-box" />
        </div>
        <div className="input-group">
          <label htmlFor="email">Email</label>
          <input type="text" name="email" id="email" className="input-box" />
        </div>
        <button className="btn btn-primary">Register</button>
      </form>
    </div>
  );
}

export default Register;
