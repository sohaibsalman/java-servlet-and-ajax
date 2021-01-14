package com.example.ajax_test;

import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


@WebServlet(name = "testServlet", value = "/test")
public class TestServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<Movie> subjects = new ArrayList<>();


        subjects.add(new Movie("avengers", "action", 2019));
        subjects.add(new Movie("avengers2", "action", 2019));
        subjects.add(new Movie("avenger3", "action", 2019));

        String s = new Gson().toJson(subjects);


        resp.setContentType("application/json");
        resp.getWriter().write(s);
    }
}
