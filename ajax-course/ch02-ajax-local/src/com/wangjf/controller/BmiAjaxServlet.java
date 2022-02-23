package com.wangjf.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

public class BmiAjaxServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        //接受请求参数
        String name = request.getParameter("name");
        String weight = request.getParameter("w");
        String height = request.getParameter("h");
        //计算bmi
        float w = Float.valueOf(weight);
        float h = Float.valueOf(height);
        float bmi = w / (h * h);
        String msg = "";
        //判断bmi的范围
        if (bmi <= 18.5) {
            msg = "太瘦了";
        } else if (bmi > 18.5 && bmi <= 23.9) {
            msg = "你的bmi数值正常";
        } else if (bmi > 23.9 && bmi <= 27) {
            msg = "你已经属于胖子了";
        } else {
            msg = "过度肥胖！";
        }
        msg = "您好：" + name + "先生/女士，您的bmi值为：" + bmi + "，" + msg;

      //输出结果
        response.setContentType("text/html;charset=utf-8");
        PrintWriter pw = response.getWriter();
        pw.print(msg);
        pw.flush();
        pw.close();
    }
    }

