/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/*
 * Show detail page the summary with the given parameters:
 *  elementId:  Id of a given summary
 *  sourceId:   Id of a news source
 *  articleId:  Id of an article
 */
function showDetailPage(articleId, articleUrl) {
    alert("SHOW_DETAIL_PAGE for article " + articleId + " with url " + articleUrl);
    window.open(articleUrl);
    // var targetUrl = 'detail.jsp'+ "?articleId=" + articleId;
    // TODO: Schould call on targetUrl instead
    // window.open(targetUrl);
}