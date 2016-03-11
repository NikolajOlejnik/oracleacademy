<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title>Актуальные задания</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" type="text/css" href="../resources/css/bootstrap.min.css"/>
  <link rel="stylesheet" type="text/css" href="../resources/css/font-awesome.min.css"/>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="container">
  <div class="row">

    <p></p>

    <div class="col-md-10 col-md-offset-1">
      <div class="panel panel-default panel-table">
        <div class="panel-heading">
          <div class="row">
            <div class="col col-xs-6">
              <h3 class="panel-title">Актуальные задания:</h3>
            </div>
          </div>
        </div>
        <div class="panel-body">
          <table class="table table-striped table-bordered table-list">
            <thead>
            <tr>
              <th>Готовы выполнить?</th>
              <th>Задача</th>
              <th>Описание</th>
              <th>Оплата</th>
            </tr>
            </thead>
            <tbody>
            <tr>
              <c:forEach items="${taskList}" var="task">
              <td align="center">
                <a class="btn btn-success" href="/task/${task.id}" method="GET"><em class="fa fa-check"></em></a>
              </td>
              <td>${task.title}</td>
              <td>${task.description}</td>
              <td>${task.price}</td>
            </tr>
            </tbody>
            </c:forEach>
          </table>

        </div>
        <div class="panel-footer">
          <div class="row">
            <div class="col col-xs-4">Page 1 of 5
            </div>
            <div class="col col-xs-8">
              <ul class="pagination hidden-xs pull-right">
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
              </ul>
              <ul class="pagination visible-xs pull-right">
                <li><a href="#">«</a></li>
                <li><a href="#">»</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>

    </div>
  </div>
</div>

</body>
</html>