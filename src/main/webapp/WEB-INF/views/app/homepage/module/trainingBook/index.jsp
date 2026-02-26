<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
$(function(){
	$('div#trainingBookLayer').load('trainingBook.do?homepage_id=${trainingBook.homepage_id}&group_idx=${trainingBook.group_idx}&category_idx=${trainingBook.category_idx}&training_idx=${trainingBook.training_idx}&menu_idx=${trainingBook.menu_idx}');
});	 
</script>
<div id="trainingBookLayer">

</div>
