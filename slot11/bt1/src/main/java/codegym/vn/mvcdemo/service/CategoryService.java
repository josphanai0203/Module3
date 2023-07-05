package codegym.vn.mvcdemo.service;

import codegym.vn.mvcdemo.model.Category;

import java.util.List;

public interface CategoryService {
    Category findById(int id);
    List<Category> findAll();
}
