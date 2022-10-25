describe("Signin", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("homepage should load with login and signup button", () => {
    cy.get(".logsign").should("have.text", "\n      Login | Signup\n  ");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
});
