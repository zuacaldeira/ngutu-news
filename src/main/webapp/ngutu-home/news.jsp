<%@page import="db.news.NewsArticle"%>
<%@page import="java.util.Collection"%>
<%@page import="backend.services.news.StatsService"%>
<%@page import="backend.services.news.NewsSourceService"%>
<%@page import="backend.services.news.NewsAuthorService"%>
<%@page import="backend.services.news.NewsArticleService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/mobile.css">
    </head>

    <body>

        <div id="wrapper">

            <!-- HEADER -->
            <header id="header">
                <!-- LOGO -->
                <div id="logo">
                    n<span style="display: none;">gutu.org</span>
                </div>
            <nav class="top">
                <ul>
                    <li><a href="index.jsp">home</a></li>
                    <li><a href="about-us.jsp">about us</a></li>
                    <li class="active"><a href="news.jsp">news</a></li>
                    <li><a href="diaspora.jsp">diaspora</a></li>
                    <li><a href="timeline.jsp">timeline</a></li>
                    <li><a href="affiliated.jsp">affiliated</a></li>
                    <li><a href="contact.jsp">contact</a></li>
                    <li><a href="blog.jsp">blog</a></li>
                </ul>
            </nav>

            </header>

            <!-- NAVIGATION -->
            <!-- CONTENT -->
            <main>
                <article class="top clearfix">
                    <h1><a href="http://news.ngutu.org">NGUTU NEWS</a></h1>
                    <p>
                        <strong>NGUTU NEWS</strong> bring news around the World, 
                        enlarging awareness of global trends and challenges, in 
                        an effective and productive way
                    </p>
                    <section class="articles">
                        <figure id="articles-count" class="count-circle">
                            <p><% out.println(new StatsService().countAllArticles()); %></p>
                            <figcaption>Articles</figcaption>
                        </figure>
                        <figure id="authors-count" class="count-circle">
                            <p><% out.println(new NewsAuthorService().count()); %></p>
                            <figcaption>Authors</figcaption>
                        </figure>
                        <figure id="publishers-count" class="count-circle">
                            <p><% out.println(new StatsService().countAllPublishers()); %></p>
                            <figcaption>Publishers</figcaption>
                        </figure>
                        <figure id="countries-count" class="count-circle">
                            <p><% out.println(new StatsService().countAllCountries()); %></p>
                            <figcaption>Countries</figcaption>
                        </figure>
                        <figure id="languages-count" class="count-circle">
                            <p><% out.println(new StatsService().countAllLanguages());%></p>
                            <figcaption>Languages</figcaption>
                        </figure>
                    </section>
                </article>
                <article class="clearfix">
                    <h1>Latest News</h1>
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
                <article>
                    <h1>Search for News</h1>
                    <fieldset id="search-fieldset">
                        <form id="search-form" name="search-form" method="get" action="news.jsp">
                            <div>
                                <input name="search" type="text" size="50" required>
                            </div>
                        </form>
                    </fieldset>
                    <section class="articles">
                    <%
                        out.println("<p>" + "looking for: " + request.getParameter("search")  + "</p>");
                       
                        if (request.getParameter("search") != null) {
                            String searchTerm = (String) request.getParameter("search");
                            articles = new NewsArticleService().findArticlesWithText(searchTerm);
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
                        }

                    %>                        
                    </section>
                </article>
            </main>

            <!-- FOOTER -->
            <footer id="footer">
                <nav>
                    <ul>
                        <li><a href="#">impressum</a></li>
                        <li><a href="#">privacy</a></li>
                    </ul>
                </nav>
            </footer>
        </div>
    </body>

</html>
