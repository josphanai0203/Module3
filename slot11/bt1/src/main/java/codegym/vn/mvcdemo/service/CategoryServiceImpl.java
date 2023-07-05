package codegym.vn.mvcdemo.service;

import codegym.vn.mvcdemo.model.Category;
import codegym.vn.mvcdemo.repository.CategoryRepository;
import codegym.vn.mvcdemo.repository.CategoryRepositoryImpl;

import java.util.List;

public class CategoryServiceImpl implements CategoryService {
    private CategoryRepository repository = new CategoryRepositoryImpl();
    @Override
    public Category findById(int id) {
        return repository.findById(id);
    }

    @Override
    public List<Category> findAll() {
        return repository.findAll();
    }
}
