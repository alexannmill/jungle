describe("Product Details", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("displays product details from homepage", () => {
    cy.get(".products article").first().click();
    cy.get(".product-detail p").should("be.visible");
    cy.get(".product-detail h1").should("be.visible");
  });
});
