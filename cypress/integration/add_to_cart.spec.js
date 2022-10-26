describe("Product Details", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("adds an item to the cart when clicking on product 'Add' from the homepage", () => {
    //cart value before click
    const cartBefore = cy.get("#cart");
    console.log("cartBefore:", cartBefore);
    cy.get(".btn").first().click({ force: true });
    //cart value after click
    const cartAfter = cy.get("#cart");
    expect(cartAfter).not.to.eq(cartBefore);
  });
});
