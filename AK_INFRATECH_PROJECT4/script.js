const products = [
  {
    id: 1,
    name: "T-shirt",
    price: 499,
    image: "assets/tshirt.jpg",
  },
  {
    id: 2,
    name: "Sneakers",
    price: 1599,
    image: "assets/shoes.jpg",
  },
  {
    id: 3,
    name: "Backpack",
    price: 899,
    image: "assets/bag.jpg",
  },
];

const productList = document.getElementById("product-list");

products.forEach((product) => {
  const card = document.createElement("div");
  card.className = "card";
  card.innerHTML = `
    <img src="${product.image}" alt="${product.name}" width="100%" />
    <h3>${product.name}</h3>
    <p>₹${product.price}</p>
    <button onclick="addToCart(${product.id})">Add to Cart</button>
  `;
  productList.appendChild(card);
});

function addToCart(id) {
  alert(`Product with ID ${id} added to cart`);
}
