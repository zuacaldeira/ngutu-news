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

function showDetailPage() {
    var n = arguments.length;
    if (n === 1) {
        var id = arguments[0];
        var message = "\tId = " + id + "\n";
        var targetUrl = 'detail.jsp' + "?article=" + id;
        alert(message + "\n\tPreparing call... " + targetUrl);
        window.open(targetUrl);
    }
}