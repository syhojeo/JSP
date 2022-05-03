<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- fmt 태그 사용 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 3자리 단위수대로 끊어져서 나온다 --%>
<fmt:formatNumber value="1234567.89"></fmt:formatNumber>
${value }<br>

<%-- groupingUsed를 false로 설정했기 때문에 끊지않고 value값 그대로 나온다 --%>
<fmt:formatNumber value="1234567.89" groupingUsed="false"></fmt:formatNumber>
${value }<br>

<%-- percent 단위로 포멧을 변경하여 출력한다 --%>
<fmt:formatNumber value="0.5" type="percent"></fmt:formatNumber>
${value } <br>

<%-- currency: 화폐 currencySymbol:문구 --%>
<fmt:formatNumber value="10000" type="currency" currencySymbol="$"></fmt:formatNumber>
${value }<br>

<%-- 패턴을 설정하여 출력하고 싶은 범위까지만 출력한다 --%>
<fmt:formatNumber value="1234567.9812345" pattern="###,###.##"></fmt:formatNumber>
${value}<br>

<%-- 0으로 자릿수를 표현한 경우 0을 붙여서라도 자리수를 채워준다 --%>
<fmt:formatNumber value="1234567.89" pattern=".000"></fmt:formatNumber>
${value}<br>

<fmt:formatNumber value="123.89" pattern="00000.###"></fmt:formatNumber>
${value }<br>

<fmt:formatNumber value="456.89" pattern="##.#"></fmt:formatNumber>
${value }<br>

<fmt:formatNumber value="123456.89" pattern="############.###"></fmt:formatNumber>
${value}<br>

</body>
</html>