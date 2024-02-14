package com.sanjay.ecommerce.service;

import com.sanjay.ecommerce.dto.Purchase;
import com.sanjay.ecommerce.dto.PurchaseResponse;

public interface CheckoutService {

    PurchaseResponse placeOrder(Purchase purchase);
}
