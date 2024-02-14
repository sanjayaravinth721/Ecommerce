package com.sanjay.ecommerce.dto;

import com.sanjay.ecommerce.entity.Address;
import com.sanjay.ecommerce.entity.Customer;
import com.sanjay.ecommerce.entity.Order;
import com.sanjay.ecommerce.entity.OrderItem;
import lombok.Data;

import java.util.Set;

@Data
public class Purchase {

    private Customer customer;
    private Address shippingAddress;
    private Address billingAddress;
    private Order order;
    private Set<OrderItem> orderItems;

}
