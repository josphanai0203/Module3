package controller;

import dao.UserDAO;
import model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "loadSearch", value = "/load")
public class loadSearch extends HttpServlet {
    private UserDAO ud;

    @Override
    public void init() throws ServletException {
        ud = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String value = request.getParameter("search");
        List<User> listAll = ud.selectAllUsers();
        List<User> result = new ArrayList<>();
        for (User u : listAll) {
            if (u.getName().contains(value)) {
                result.add(u);
            }
        }
        PrintWriter out = response.getWriter();
        out.println(" <table border=\"1\" cellpadding=\"5\">\n" +
                "        <caption><h2>List of Users</h2></caption>\n" +
                "        <tr>\n" +
                "            <th>ID</th>\n" +
                "            <th>Name</th>\n" +
                "            <th>Email</th>\n" +
                "            <th>Country</th>\n" +
                "            <th>Actions</th>\n" +
                "        </tr>");
        for (User r : result) {
            out.println("<tr>\n" +
                    "                <td>" + r.getId() + "</td>\n" +
                    "                <td>" + r.getName() + "</td>\n" +
                    "                <td>" + r.getEmail() + "</td>\n" +
                    "                <td>" + r.getCountry() + "</td>\n" +
                    "                <td>\n" +
                    "                    <a href=\"/users?action=edit&id=" + r.getId() + "\">Edit</a>\n" +
                    "                    <a href=\"/users?action=delete&id=" + r.getId() + "\">Delete</a>\n" +
                    "                </td>\n" +
                    "            </tr>");
        }
        out.println("</table>");
    }

}