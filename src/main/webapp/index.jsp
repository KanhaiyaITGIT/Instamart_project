<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Instamart – Instant Grocery Delivery</title>
  <style>
    * { box-sizing: border-box; font-family: Arial, Helvetica, sans-serif; }
    body { margin: 0; background: #f6f7f9; }

    /* Header */
    header {
      background: #fc8019;
      color: white;
      padding: 15px 30px;
      display: flex;
      align-items: center;
      justify-content: space-between;
    }
    header h1 { margin: 0; font-size: 24px; }
    header input {
      width: 300px;
      padding: 8px;
      border-radius: 5px;
      border: none;
    }

    /* Categories */
    .categories {
      display: flex;
      gap: 15px;
      padding: 20px 30px;
      overflow-x: auto;
      background: white;
    }
    .category {
      min-width: 120px;
      padding: 12px;
      background: #f2f2f2;
      text-align: center;
      border-radius: 8px;
      cursor: pointer;
      font-weight: bold;
    }

    /* Products */
    .products {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
      gap: 20px;
      padding: 30px;
    }
    .card {
      background: white;
      border-radius: 10px;
      padding: 15px;
      box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    }
    .card img {
      width: 100%;
      height: 150px;
      object-fit: cover;
      border-radius: 8px;
    }
    .card h3 { margin: 10px 0 5px; }
    .price { color: green; font-weight: bold; }
    .card button {
      margin-top: 10px;
      width: 100%;
      padding: 8px;
      border: none;
      border-radius: 6px;
      background: #fc8019;
      color: white;
      cursor: pointer;
      font-size: 14px;
    }

    /* Cart */
    .cart {
      position: fixed;
      right: 20px;
      bottom: 20px;
      background: #2ecc71;
      color: white;
      padding: 15px 20px;
      border-radius: 50px;
      font-weight: bold;
    }

    footer {
      background: #222;
      color: white;
      text-align: center;
      padding: 15px;
    }
  </style>
</head>
<body>

<header>
  <h1>Instamart</h1>
  <input type="text" placeholder="Search for groceries..." />
</header>

<section class="categories">
  <div class="category">Vegetables</div>
  <div class="category">Fruits</div>
  <div class="category">Dairy</div>
  <div class="category">Snacks</div>
  <div class="category">Beverages</div>
</section>

<section class="products" id="products">
  <!-- Products injected by JS -->
</section>

<div class="cart" id="cart">🛒 Cart: 0 items</div>

<footer>
  <p>© 2025 Instamart Clone | Instant Delivery</p>
</footer>

<script>
  const products = [
    { name: "Tomato", price: 40, img: "https://via.placeholder.com/300x200?text=Tomato" },
    { name: "Apple", price: 120, img: "https://via.placeholder.com/300x200?text=Apple" },
    { name: "Milk", price: 55, img: "https://via.placeholder.com/300x200?text=Milk" },
    { name: "Bread", price: 35, img: "https://via.placeholder.com/300x200?text=Bread" },
    { name: "Chips", price: 30, img: "https://via.placeholder.com/300x200?text=Chips" },
    { name: "Cold Drink", price: 45, img: "https://via.placeholder.com/300x200?text=Drink" }
  ];

  const productDiv = document.getElementById('products');
  const cart = document.getElementById('cart');
  let cartCount = 0;

  products.forEach(p => {
    const card = document.createElement('div');
    card.className = 'card';
    card.innerHTML = `
      <img src="${p.img}" />
      <h3>${p.name}</h3>
      <p class="price">₹${p.price}</p>
      <button>Add to Cart</button>
    `;

    card.querySelector('button').onclick = () => {
      cartCount++;
      cart.innerText = `🛒 Cart: ${cartCount} items`;
    };

    productDiv.appendChild(card);
  });
</script>

</body>
</html>
