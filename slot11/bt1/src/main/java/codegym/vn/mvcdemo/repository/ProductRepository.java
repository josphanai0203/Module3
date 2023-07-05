package codegym.vn.mvcdemo.repository;

import codegym.vn.mvcdemo.model.Product;

import java.util.List;

public interface ProductRepository {
    void add(Product product);
    void delete(Product product);
    Product findById(int id);
    void update(Product product);
    List<Product> findAll();
}
