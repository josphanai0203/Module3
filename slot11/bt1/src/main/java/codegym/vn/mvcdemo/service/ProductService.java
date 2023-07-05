package codegym.vn.mvcdemo.service;

import codegym.vn.mvcdemo.model.Product;

import java.util.List;

public interface ProductService {
    void add(Product product);
    void delete(Product product);
    Product findById(int id);
    void update(Product product);
    List<Product> findAll();
}
