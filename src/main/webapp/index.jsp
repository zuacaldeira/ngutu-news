<%@page import="backend.services.news.NewsAuthorService"%>
<%@page import="backend.services.news.StatsService"%>
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
                <nav class="top">
                    <ul>
                        <li id="logo" class="logo"><a href="http://www.ngutu.org">ngutu.org</a></li>
                        <li class="active"><a href="index.jsp">Home</a></li>
                        <li><a href="latest.jsp">Latest</a></li>
                        <li><a href="categories.jsp">Categories</a></li>
                        <li><a href="pubishers.jsp">Publishers</a></li>
                        <li><a href="languages.jsp">Languages</a></li>
                        <li><a href="countries.jsp">Countries</a></li>
                        <li><a href="search.jsp">Search</a></li>
                    </ul>
                </nav>
                <h1>NEWS.NGUTU.ORG</h1>
                <h2>Celebrating the world as one</h2>
            </header>


            <!-- MAIN CONTENT -->
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
