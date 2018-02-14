<%@page import="db.news.NewsArticle"%>
<%@page import="backend.services.news.NewsArticleService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html>

    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/mobile.css">
    </head>

    <body>

        <div id="wrapper">

            <!-- HEADER -->
            <header>
                <!-- TOP NAVIGATION  -->
                <nav class="top clearfix">
                    <ul>
                        <li id="logo" class="logo"><a href="http://www.ngutu.org">ngutu.org</a></li>
                        <li><a href="index.jsp">Home</a></li>
                        <li class="active"><a href="latest.jsp">Latest</a></li>
                        <li><a href="categories.jsp">Categories</a></li>
                        <li><a href="pubishers.jsp">Publishers</a></li>
                        <li><a href="languages.jsp">Languages</a></li>
                        <li><a href="countries.jsp">Countries</a></li>
                        <li><a href="contact.jsp">Contact</a></li>
                        <li><a href="blog.jsp">Blog</a></li>
                        <li><a href="search.jsp">Search</a></li>
                    </ul>
                </nav>
                <h1>Latest News</h1>
                <h2>The Power of Now</h2>
            </header>


            <!-- MAIN CONTENT -->
            <main>
                <article class="clearfix">
                    <section class="articles">
                        <%
                            Iterable<NewsArticle> articles = new NewsArticleService().findLatest();
                            for (NewsArticle art : articles) {
                                if (art.getImageUrl() != null) {
                                    out.println("<figure class=\"count-circle\">");
                                    out.println("   <a href=\"" + art.getUrl() + "\" target=\"_blank\">");
                                    out.println("       <img src=\"" + art.getImageUrl() + "\"" + "height=\"100\"" + "\">");
                                    out.println("   </a>");
                                    out.println("   <figcaption>" + art.getTitle() + "</figcaption>");
                                    out.println("</figure>");
                                }
                            }
                            articles = null;
                        %>
                    </section>
                </article>
            </main>

            <!-- FOOTER -->
            <footer>
                <nav>
                    <ul>
                        <li><a href="#">impressum</a></li>
                        <li><a href="#">privacy</a></li>
                        <li><a href="#">about us</a></li>
                        <li><a href="contact.jsp">Contact</a></li>
                        <li><a href="blog.jsp">Blog</a></li>
                    </ul>
                </nav>
            </footer>
        </div>
    </body>

</html>
