package com.multi.jsp04.dao;

import com.multi.jsp04.vo.CustomerVO;

import java.util.HashMap;
import java.util.Map;

public class CustomerDAO {
    private Map<String, CustomerVO> customers = new HashMap<>();

    public void addCustomer(CustomerVO customer) {
        customers.put(customer.getId(), customer);
    }

    public void deleteCustomer(String id) {
        customers.remove(id);
    }
}
