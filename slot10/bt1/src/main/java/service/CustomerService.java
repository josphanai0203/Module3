package service;

import model.Customer;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerService {
    private static Map<Integer, Customer> customrMap;
    static {
        customrMap = new HashMap<>();
        customrMap.put(1, new Customer(1, "Nam", 20, "./img/pexels-photo-2754200.jpeg"));
        customrMap.put(2, new Customer(2, "Hoang", 21, "./img/pexels-photo-2754200.jpeg"));
        customrMap.put(3, new Customer(3, "Lan", 22, "./img/pexels-photo-2754200.jpeg"));
        customrMap.put(4, new Customer(4, "Hai", 19, "./img/pexels-photo-2754200.jpeg"));
        customrMap.put(5, new Customer(5, "Manh", 20, "./img/pexels-photo-2754200.jpeg"));
    }

    public List<Customer> getList() {
        return new ArrayList<>(customrMap.values());
    }

}
