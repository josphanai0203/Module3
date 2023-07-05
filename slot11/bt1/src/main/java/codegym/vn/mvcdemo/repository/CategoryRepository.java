package codegym.vn.mvcdemo.repository;

import codegym.vn.mvcdemo.model.Category;

import java.util.List;

public interface CategoryRepository {
    Category findById(int id);
    List<Category> findAll();
}
