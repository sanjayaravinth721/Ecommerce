# Ecommerce Platform

## Project Overview
This repository hosts the design and development of a robust Ecommerce platform, integrating Java Spring Boot for the backend and Angular for the frontend. The project evolves through three releases, progressively enhancing user interactions and ensuring secure transactions.

## Key Features

### Release 1: Product Showcase
- **Objective:** Present visually appealing product listings.
- **Implementation:** Angular-driven responsive product interface.

### Release 2: Cart Management & Checkout
- **Objectives:**
  - Enable dynamic CRUD operations for the shopping cart.
  - Streamline the shopping cart checkout process.
- **Implementation:** Intuitive cart manipulation, ensuring a seamless checkout experience.

### Release 3: Elevated User Experience
- **Objectives:**
  - Implement robust user login/logout with heightened security.
  - Provide exclusive VIP page access for authenticated users.
  - Track comprehensive order history for registered customers.
- **Implementation:** Fortified security, VIP privileges, and personalized order histories.

## Database Schema Relationships

### Tables:

#### 1. Customer:
- **Fields:** id, firstname, lastname, email.
- **Relationships:**
  - One-to-Many with Order (A customer can have 0 to many orders).

#### 2. Order:
- **Fields:** id, order_tracking_number, total_price, total_quantity, billing_address_id, shipping_address_id, customer_id, status, date_created, last_updated.
- **Relationships:**
  - Many-to-One with Customer (Many orders can belong to one customer).
  - 0 to 1 with Address for billing and shipping.

#### 3. Address:
- **Fields:** id, city, country, state, street, zip_code.
- **Relationships:**
  - 0 to 1 with Order for both billing and shipping addresses.

#### 4. Order_Item:
- **Fields:** id, image_url, quantity, unit_price, order_id, product_id.
- **Relationships:**
  - Many-to-One with Order (Many order items can belong to one order).
  - Many-to-One with Product (Many order items can relate to one product).

#### 5. Product:
- **Fields:** id, SKU, name, description, unit_price, image_url, active, units_in_stock, date_created, last_updated, category_id.
- **Relationships:**
  - Many-to-One with Product_Category (Many products can belong to one category).

#### 6. Product_Category:
- **Fields:** id, category_name.
- **Relationships:**
  - One-to-Many with Product (One category can have many products).

#### 7. Country:
- **Fields:** id, code, name.
- **Relationships:**
  - One-to-Many with State (One country can have many states).

#### 8. State:
- **Fields:** id, name, country_id.
- **Relationships:**
  - Many-to-One with Country (Many states can belong to one country).

### Deployment Guide
- **Port Configurations:**
  - **Development:** `server.port: 8443`
  - **QA:** `server.port: 9898`
  - **Production:** `server.port: 80`
- **Database:** PostgreSQL.

### Running the Frontend
- Run Angular application with chosen configuration:
  - For QA: `npm start -- --configuration=qa`
  - For Production: `npm start -- --configuration=production`
  - For Development: `npm start -- --configuration=development`

## Okta Integration

### Internal Workflow:
1. **User Authentication:**
   - User logs in using Okta.
   - Okta provides an auth token to the client app.

2. **Access Token Request:**
   - Client app requests an access token from Okta.

3. **Access Token Verification:**
   - Backend (Spring Boot) validates and verifies the access token with Okta.

4. **Resource Access:**
   - Spring Boot provides access to protected resources.

## Technology Stack
- Java Spring Boot
- Angular
- PostgreSQL for data storage
- Okta for secure authentication and authorization

## Additional Resources
- [Okta Developer Account Setup](https://developer.okta.com/signup/)
- [Detailed Okta Authorization Flow](https://github.com/darbyluv2code/fullstack-angular-and-springboot/blob/master/bonus-content/secure-https-communication/openssl-setup.md)

## Noteworthy
- This repository is a comprehensive Ecommerce solution, focusing on security, user experience, and seamless deployment across diverse environments. Explore the codebase to envision the future of online retail
