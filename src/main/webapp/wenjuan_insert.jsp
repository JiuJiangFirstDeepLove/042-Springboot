<%@ page language="java"   pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@ page import="com.alibaba.fastjson.*" %>
<%@ page import="com.spring.util.Info" %>
<%@ page import="com.spring.util.Query" %>


<%


    if (request.getParameter("f") != null) {


        String json1 = request.getParameter("JSON");
        String id = request.getParameter("id");
        JSONArray json = JSON.parseArray(json1);
        JSONObject leixingdefen = JSON.parseObject(request.getParameter("leixingdefen"));
        JSONObject map = JSON.parseObject(request.getParameter("map"));
        HashMap data = new HashMap();

        data.put("tijiaoren", request.getSession().getAttribute("username"));
        data.put("addtime", Info.getDateStr());

        HashMap m = new HashMap();
        for (int i = 0; i < json.size(); i++) {
            JSONObject obj = json.getJSONObject(i);
            obj.putAll(data);
            obj.put("timuid", obj.get("id"));
            obj.remove("id");
            m.putAll(obj);
            m.put("fenlei", map.get("fenlei"));
            Query.make("dati").insert(m);
        }

        out.println("{\"code\":0,\"data\":0}");
        out.flush();
        //out.close();
    } else {
        out.println("{code:1,msg:\"信息提交失败\"}");
        //out.close();
    }
%>