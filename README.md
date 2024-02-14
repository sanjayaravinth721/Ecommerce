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

### Security
- The application is secured using HTTPS. Self-signed certificates have been created for both frontend and backend. The frontend is accessible at `https://localhost:4200`.

## Okta Integration

### Okta Cloud Platform
Okta serves as a cloud-based authorization server and platform, providing a robust set of authentication features including login widgets, social login, role-based access authorization, and comprehensive user management through an admin panel.

### Industry Standards and Advantages
Okta aligns with industry standards such as OAuth2, OpenID Connect, and JWT. This approach significantly reduces low-level boilerplate coding, offering convenient Software Development Kits (SDKs) for Angular and Java developers.

### OAuth2 Workflow
In the OAuth2 workflow, the resource owner initiates the login process. The Angular client app receives these credentials, forwarding them to the Okta authorization server. Okta, in turn, responds by providing an authentication token. Subsequently, the client app requests an access token from the authorization server, and Okta returns the access token. The client app then transmits the access token to the Spring Boot resource server. Spring Boot meticulously verifies and validates the token with the Okta authorization server, ultimately granting access to protected resources.

This seamless integration ensures heightened security, offering a standardized and efficient authentication and authorization process. Okta's support for industry standards further enhances the application's overall security architecture.


## Technology Stack
- Java Spring Boot
- Angular
- PostgreSQL for data storage
- Okta for secure authentication and authorization

## Additional Resources
- [Okta Developer Account Setup](https://developer.okta.com/signup/)
- [Detailed Okta Authorization Flow](https://github.com/darbyluv2code/fullstack-angular-and-springboot/blob/master/bonus-content/secure-https-communication/openssl-setup.md)

## Noteworthy
- This repository is a comprehensive Ecommerce solution, focusing on security, user experience, and seamless deployment across diverse environments. Explore the codebase to envision the future of online retail.
