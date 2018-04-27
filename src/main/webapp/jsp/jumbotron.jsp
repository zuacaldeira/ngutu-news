<%-- 
    Document   : newjsp
    Created on : Apr 1, 2018, 11:48:01 AM
    Author     : zua
--%>

<%@page import="backend.services.news.NewsAuthorService"%>
<%@page import="backend.services.news.StatsService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="jumbotron">
    <div class="message">
        <div class="col-sm-1 col-md-2 col-lg-3"></div>
        <div class="col-sm-10 col-md-8 col-lg-6">
            <h1>What's Going On?</h1>
            <p>
                news.ngutu.org bring news around the World, 
                for improved awareness of global trends and challenges,
                in an effective and productive way
            </p>
            <!--ul>
                <li>Articles<span class="badge"><% out.print(new StatsService().countAllArticles());%></span></li>
                <li>Authors<span class="badge"><% out.print(new NewsAuthorService().count()); %></span></li>
                <li>Publishers<span class="badge"><% out.print(new StatsService().countAllPublishers()); %></span></li>
                <li>Countries<span class="badge"><% out.print(new StatsService().countAllCountries()); %></span></li>
                <li>Languages<span class="badge"><% out.print(new StatsService().countAllLanguages());%></span></li>
            </ul-->
            <form class="navbar-form"  name="search-form" method="get" action="index.jsp">
                <div class="input-group">
                    <input class="form-control" name="search" type="text" size="100%" required>
                    <div class="input-group-btn">
                        <button class="btn" type="submit">
                            <i class="glyphicon glyphicon-search"></i>
                        </button>
                    </div>
                </div>
            </form>
        </div>
        <div class="col-sm-1 col-md-2 col-lg-3"></div>            
    </div>
</div>                        
