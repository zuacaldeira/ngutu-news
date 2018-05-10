<%@page import="java.util.Enumeration"%>
<%@page import="db.news.NewsArticle"%>
<%@page import="backend.services.news.NewsArticleService"%>
<%@page import="backend.utils.MyDateUtils"%>
<%@page import="java.util.TreeSet"%>
<%@page import="backend.services.news.NewsSourceService"%>
<%@page import="backend.services.news.NewsAuthorService"%>
<%@page import="backend.services.news.StatsService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet"  href="css/style.css" type="text/css">
        <link rel="stylesheet"  href="css/mobile.css" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="js/nested_dropdown.js"></script>
        <script src="js/ngutu_news.js"></script>
    </head>

    <body>
        <!-- HEADER -->
        <header>
            <!-- TOP NAVIGATION  -->
            <%@include file="jsp/nav.jsp" %>
        </header>


        <!-- MAIN CONTENT -->
        <main class="container-fluid">
            <%@include file="jsp/jumbotron.jsp"%>
            <%@include file="jsp/summaries.jsp" %>
        </main>

        <!-- FOOTER -->
        <footer class="footer navbar navbar-inverse">
                <ul class="nav navbar-nav">
                    <li><a href="#">impressum</a></li>
                    <li><a href="#">privacy</a></li>
                    <li><a href="#">about us</a></li>
                    <li><a href="contact.jsp">Contact</a></li>
                    <li><a href="blog.jsp">Blog</a></li>
                </ul>
        </footer>
    </body>
    <script src="js/ngutu_news.js"></script>

</html>
