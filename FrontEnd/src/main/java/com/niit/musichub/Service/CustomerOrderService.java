package com.niit.musichub.Service;

import com.niit.musichub.model.CustomerOrder;

public interface CustomerOrderService {


    void addCustomerOrder(CustomerOrder customerOrder);

    double getCustomerOrderGrandTotal(int cartId);

}
