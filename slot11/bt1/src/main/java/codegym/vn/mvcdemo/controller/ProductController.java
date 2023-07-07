package codegym.vn.mvcdemo.controller;

import codegym.vn.mvcdemo.model.Category;
import codegym.vn.mvcdemo.model.Product;
import codegym.vn.mvcdemo.service.CategoryService;
import codegym.vn.mvcdemo.service.CategoryServiceImpl;
import codegym.vn.mvcdemo.service.ProductService;
import codegym.vn.mvcdemo.service.ProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet(urlPatterns = "/product")
public class ProductController extends HttpServlet {
    private ProductService productService = new ProductServiceImpl();
    private CategoryService categoryService = new CategoryServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "list":
                viewList(req, resp);
                break;
            case "detail":
                viewDetail(req, resp);
                break;
            case "create":
                viewCreate(req, resp);
            case "update":
                viewUpdate(req,resp);
            case "delete":
                doDeleteP(req,resp);
            default:

        }
    }
    private void doDeleteP(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Product del = new Product();
        del.setId(id);
        productService.delete(del);
        resp.sendRedirect("/product?action=list");
    }

    private void viewCreate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Category> categories = categoryService.findAll();
        req.setAttribute("categories", categories);
        req.getRequestDispatcher("/WEB-INF/views/product/create.jsp")
                .forward(req, resp);
    }

    private void viewDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Product product = productService.findById(id);
        req.setAttribute("product", product);
        req.getRequestDispatcher("/WEB-INF/views/product/detail.jsp")
                .forward(req, resp);
    }

    private void viewList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> products = productService.findAll();
        req.setAttribute("products", products);
        req.getRequestDispatcher("/WEB-INF/views/product/list.jsp")
                .forward(req, resp);
    }
    private void viewSearch(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {

    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            resp.sendRedirect("/product?action=list");
            return;
        }

        switch (action) {
            case "create":
                doCreate(req, resp);
                break;

            case "update":
                doUpdate(req,resp);
                break;
            case "search":
                doSearch(req,resp);
                break;
            default:
        }
    }
    private void doSearch(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String value = req.getParameter("valueSearch").trim();
        List<Product> list = productService.findAll();
        List<Product> result = new ArrayList<>();
        for(Product p : list){
            if(p.getName().contains(value)){
                result.add(p);
            }
        }
        req.setAttribute("value",value);
        req.setAttribute("searchList",result);
        req.getRequestDispatcher("/WEB-INF/views/product/list.jsp").forward(req,resp);
    }
    private void doCreate(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        int price = Integer.parseInt(req.getParameter("price"));
        String date = req.getParameter("dateRelease");
        SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
        Date dateRelease = null;
        try {
            dateRelease = format.parse(date);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        int categoryId = Integer.parseInt(req.getParameter("categoryId"));
        Category category = categoryService.findById(categoryId);
        Product product = new Product(id, name, quantity, price, dateRelease, category);
        productService.add(product);
        resp.sendRedirect("/product?action=list");
    }
    private void viewUpdate(HttpServletRequest req, HttpServletResponse resp)  throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Product product = productService.findById(id);
        List<Category> categories = categoryService.findAll();
        String date = product.getDateRelease().getDate()+"/"+(product.getDateRelease().getMonth()+1)+"/"+ (product.getDateRelease().getYear()+1900);
        req.setAttribute("categories", categories);
        req.setAttribute("p", product);
        req.setAttribute("date",date);
        req.getRequestDispatcher("/WEB-INF/views/product/create.jsp").forward(req, resp);
    }
    private void doUpdate(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        int price = Integer.parseInt(req.getParameter("price"));
        String date = req.getParameter("dateRelease");
        SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
        Date dateRelease = null;
        try {
            dateRelease = format.parse(date);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        int categoryId = Integer.parseInt(req.getParameter("categoryId"));
        Category category = categoryService.findById(categoryId);
        Product product = new Product(id, name, quantity, price, dateRelease, category);
        productService.update(product);
        resp.sendRedirect("/product?action=list");
    }
}
