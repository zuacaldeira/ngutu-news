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
                        <li><a href="index.jsp">Home</a></li>
                        <li class="active"><a href="latest.jsp">Latest</a></li>
                        <li><a href="categories.jsp">Categories</a></li>
                        <li><a href="publishers.jsp">Publishers</a></li>
                        <li><a href="languages.jsp">Languages</a></li>
                        <li><a href="countries.jsp">Countries</a></li>
                        <li><a href="search.jsp">Search</a></li>
                    </ul>
                </nav>
                <h1>Latest News</h1>
                <h2>Know Now</h2>
            </header>


            <!-- MAIN CONTENT -->
            <main>
                <section class="articles">
                    <article class="latest">
                        <div class="figures clearfix">
                            <%
                                int max = 30;
                                int delta = 5;
                                Iterable<NewsArticle> articles = new NewsArticleService().findAll(0, max+delta);
                                int i = 0;
                                for (NewsArticle art : articles) {
                                    if(i >= max) {
                                        break;
                                    }
                                    if (art.getImageUrl() != null && !art.getImageUrl().isEmpty()) {
                                        out.println("<a href=\"" + art.getUrl() + "\" target=\"_blank\">");
                                        out.println("   <figure class=\"count-circle\" style=\"background:url(" + art.getImageUrl() + ") no-repeat center center; background-size:cover;\">");
                                        out.println("       <figcaption>" + art.getTitle() + "</figcaption>");
                                        out.println("   </figure>");
                                        out.println("</a>");
                                        i++;
                                    }
                                }
                                articles = null;
                            %>
                        </div>                        
                    </article>
                </section>
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
