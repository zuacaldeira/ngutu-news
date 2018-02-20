<%@page import="java.util.TreeSet"%>
<%@page import="backend.utils.MyDateUtils"%>
<%@page import="db.news.NewsSource"%>
<%@page import="backend.services.news.NewsSourceService"%>
<%@page import="db.news.NewsArticle"%>
<%@page import="backend.services.news.NewsArticleService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html>

    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/mobile.css">
        <link rel="stylesheet" type="text/css" href="css/header-form.css">
    </head>

    <body>

        <div id="wrapper">

            <!-- HEADER -->
            <header>
                <!-- TOP NAVIGATION  -->
                <nav class="top clearfix">
                    <ul>
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="latest.jsp">Latest</a></li>
                        <li><a href="categories.jsp">Categories</a></li>
                        <li><a href="publishers.jsp">Publishers</a></li>
                        <li><a href="languages.jsp">Languages</a></li>
                        <li class="active"><a href="countries.jsp">Countries</a></li>
                        <li><a href="search.jsp">Search</a></li>
                    </ul>
                </nav>
            </header>


            <!-- MAIN CONTENT -->
            <main>
                <article>
                    <section class="top">
                        <h1>Search like a World Citizen!</h1>
                        <fieldset id="fieldset">
                            <form id="form" name="country-form" method="get" action="countries.jsp">
                                <div>
                                    <%
                                        NewsSourceService service = new NewsSourceService();
                                        Iterable<String> countries = service.findCountries();
                                        TreeSet<String> sortedCountries = new TreeSet<String>();
                                        for (String country : countries) {
                                            if (country != null && MyDateUtils.getCountry(country) != null) {
                                                sortedCountries.add(MyDateUtils.getCountry(country));
                                            }
                                        }
                                        out.println("<select name=\"country\" required>");
                                        out.println("<option>&nbsp;</option>");
                                        for (String sorted : sortedCountries) {
                                            out.println("<option>" + sorted + "</option>");
                                        }
                                        out.println("</select>");
                                    %>
                                    <input type="submit" value="Go!">
                                </div>
                            </form>
                        </fieldset>
                    </section>
                    <section class="detail">
                        <div class="summaries clearfix">
                            <%
                                String country = request.getParameter("country");
                                if (country != null) {
                                    country = MyDateUtils.getCountryCode(country);
                                    Iterable<NewsArticle> articles = new NewsArticleService().findArticlesWithCountry(country);
                                    for (NewsArticle art : articles) {
                                        if (art.getImageUrl() != null && !art.getImageUrl().isEmpty()) {
                                            out.println("<div class=\"summary\">");
                                            out.println("<a href=\"" + art.getUrl() + "\" target=\"_blank\">");
                                            out.println("   <figure class=\"count-circle\" style=\"background:url(" + art.getImageUrl() + ") no-repeat center center; background-size:cover;\">");
                                            out.println("       <figcaption>" + art.getTitle() + "</figcaption>");
                                            out.println("   </figure>");
                                            out.println("</a>");
                                            out.println("</div>");
                                        }
                                    }
                                    articles = null;
                                }
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
